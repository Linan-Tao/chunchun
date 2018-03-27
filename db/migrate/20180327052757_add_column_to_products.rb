class AddColumnToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :catalog, foreign_key: true
  end
end
