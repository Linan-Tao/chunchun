class CreateAddressBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :address_books do |t|
      t.references :visitor, foreign_key: true
      t.string :name
      t.string :mobile
      t.string :province
      t.string :city
      t.string :district
      t.string :detail_address
      t.jsonb :features

      t.timestamps
    end
  end
end
