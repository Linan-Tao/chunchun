class AddFeaturesToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :wxlite_settings, :features, :jsonb
  end
end
