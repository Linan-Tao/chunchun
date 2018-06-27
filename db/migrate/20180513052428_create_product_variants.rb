class CreateProductVariants < ActiveRecord::Migration[5.1]
  def change
    create_table :product_variants do |t|
      t.references :product, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
