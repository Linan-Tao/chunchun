class Product < ApplicationRecord
  has_many :product_dimensions
  acts_as_taggable
end
