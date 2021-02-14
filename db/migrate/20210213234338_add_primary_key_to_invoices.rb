class AddPrimaryKeyToInvoices < ActiveRecord::Migration[6.1]
  def change
    add_column :invoices, :id, :primary_key
  end
end
