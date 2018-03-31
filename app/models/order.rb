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

class Order < ApplicationRecord
  belongs_to :visitor
  has_many :order_products
  store_accessor :features, :delivery_username, :delivery_phone, :delivery_address
end
