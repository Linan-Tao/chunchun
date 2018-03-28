class CreateShoppingCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_carts do |t|
      t.references :product, foreign_key: true
      t.integer :price
      t.integer :amount
      t.references :visitor, foreign_key: true

      t.timestamps
    end
  end
end
