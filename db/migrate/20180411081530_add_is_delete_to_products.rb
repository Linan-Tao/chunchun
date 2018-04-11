class AddIsDeleteToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :is_deleted, :boolean, default: false
  end
end
