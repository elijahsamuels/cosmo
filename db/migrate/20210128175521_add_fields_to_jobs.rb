class AddFieldsToJobs < ActiveRecord::Migration[6.1]
  change_table(:jobs) do |t|
    t.text :description
  end
end
