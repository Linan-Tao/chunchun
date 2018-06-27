class CreateProductVariantOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :product_variant_options do |t|
      t.references :product_variant, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
