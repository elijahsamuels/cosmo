class AddClientIdToJobsTable < ActiveRecord::Migration[6.1]
  def change
    change_table(:jobs) do |t|
      t.integer :client_id
    end
  
  end
end
