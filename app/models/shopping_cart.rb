# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  product_id :integer
#  price      :integer
#  amount     :integer
#  visitor_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_shopping_carts_on_product_id  (product_id)
#  index_shopping_carts_on_visitor_id  (visitor_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (visitor_id => visitors.id)
#

class ShoppingCart < ApplicationRecord
  belongs_to :product
  belongs_to :visitor
end
