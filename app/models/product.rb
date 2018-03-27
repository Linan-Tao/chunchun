class Product < ApplicationRecord
  has_many :product_dimensions
  belongs_to :catalog
  acts_as_taggable
end
