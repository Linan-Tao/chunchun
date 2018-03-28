class CreateWxliteSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :wxlite_settings do |t|
      t.string :banners, array: true
      t.integer :delivery_fee

      t.timestamps
    end
  end
end
