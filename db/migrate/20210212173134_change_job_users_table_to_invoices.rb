class ChangeJobUsersTableToInvoices < ActiveRecord::Migration[6.1]
  def change
    rename_table :job_users, :invoices
  end
end
