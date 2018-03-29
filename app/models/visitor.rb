class Visitor < ApplicationRecord
  attr_accessor :session_key
  has_many :shopping_carts
  has_many :orders
end