class CreateSkusProductVariantOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :skus_product_variant_options do |t|
      t.references :sku, foreign_key: true
      t.references :product_variant, foreign_key: true
      t.references :product_variant_option, foreign_key: true

      t.timestamps
    end
  end
end
