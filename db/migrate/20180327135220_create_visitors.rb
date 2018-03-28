class CreateVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :visitors do |t|
      t.string :uid
      t.string :nickname
      t.string :headshot

      t.timestamps
    end
  end
end
