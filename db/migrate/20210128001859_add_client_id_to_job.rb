class AddClientIdToJob < ActiveRecord::Migration[6.1]
  change_table(:jobs) do |t|
    t.references :client
  end
end
