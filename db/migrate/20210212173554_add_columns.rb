class AddColumns < ActiveRecord::Migration[6.1]
  def change
    change_table(:invoices) do |t|
      t.datetime :date_invoice_sent
      t.integer :invoice_amount
    end
  end
end
