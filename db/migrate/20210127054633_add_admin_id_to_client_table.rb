class AddAdminIdToClientTable < ActiveRecord::Migration[6.1]
  change_table(:clients) do |t|
    t.references :admin
  end
end
