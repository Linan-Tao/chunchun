class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :visitor, foreign_key: true
      t.string :code
      t.integer :price
      t.string :status
      t.jsonb :features

      t.timestamps
    end
  end
end
