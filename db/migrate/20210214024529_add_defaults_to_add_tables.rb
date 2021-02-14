class AddDefaultsToAddTables < ActiveRecord::Migration[6.1]
      change_column_default :business, :name, default: "", null: false
end
