class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.string :images, array: true
      t.string :description
      t.text :content
      t.jsonb :features

      t.timestamps
    end
  end
end
