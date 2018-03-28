class ShoppingCart < ApplicationRecord
  belongs_to :product
  belongs_to :visitor
end
