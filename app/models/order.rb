class Order < ApplicationRecord
  belongs_to :visitor
  has_many :order_products
  store_accessor :features, :delivery_username, :delivery_phone, :delivery_address
end
