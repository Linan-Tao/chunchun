class CreateProductDimensions < ActiveRecord::Migration[5.1]
  def change
    create_table :product_dimensions do |t|
      t.references :product, foreign_key: true
      t.string :name
      t.string :value
      t.integer :price
      t.integer :stock
      t.string :image
      t.jsonb :features

      t.timestamps
    end
  end
end
