# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  visitor_id :integer
#  code       :string
#  price      :integer
#  status     :string
#  features   :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_orders_on_visitor_id  (visitor_id)
#
# Foreign Keys
#
#  fk_rails_...  (visitor_id => visitors.id)
#

class Order < ApplicationRecord
  belongs_to :visitor
  has_many :order_products, dependent: :destroy
  store_accessor :features, :delivery_username, :delivery_phone, :delivery_address, :pay_time
  after_create :generate_code

  STATUS = {
    open: '未支付', #订单结算
    pending: '支付中',
    paid: '支付成功',
    deliveried: '已发货',
    completed: '完成',
    cancelled: '取消'
  }


  after_initialize do
    self.status ||= 'open'
  end

  def generate_code
    today = Time.now.beginning_of_day
    todayFirstOrder = self.class.where("? <= created_at", today).order(created_at: :asc).first
    number = todayFirstOrder && self.id - todayFirstOrder.id + 1 || 1
    raise '订单当日数量超出系统限制' if number.to_s.length > 5
    self.update(code: "#{today.strftime('%Y%m%d')}#{number.to_s.rjust(5, '0')}")
  end

end
