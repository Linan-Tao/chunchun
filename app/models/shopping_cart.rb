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

class ShoppingCart < ApplicationRecord
  belongs_to :product
  belongs_to :visitor
end
