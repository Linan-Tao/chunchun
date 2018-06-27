class CreateSkus < ActiveRecord::Migration[5.1]
  def change
    create_table :skus do |t|
      t.references :product, foreign_key: true
      t.string :sku
      t.integer :price
      t.integer :total

      t.timestamps
    end
  end
end
