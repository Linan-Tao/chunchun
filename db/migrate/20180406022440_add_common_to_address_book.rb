class AddCommonToAddressBook < ActiveRecord::Migration[5.1]
  def change
    add_column :address_books, :common, :boolean, default: false
  end
end
