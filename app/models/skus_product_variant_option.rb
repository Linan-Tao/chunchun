class SkusProductVariantOption < ApplicationRecord
  belongs_to :sku
  belongs_to :product_variant
  belongs_to :product_variant_option
end
