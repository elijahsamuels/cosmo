class AddPaidBooleanToInvoicesTable < ActiveRecord::Migration[6.1]
  def change
        add_column :invoices, :paid, :boolean, default: false
  end
end
