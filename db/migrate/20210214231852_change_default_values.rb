class ChangeDefaultValues < ActiveRecord::Migration[6.1]
  def change
    change_column_default :invoices, :date_invoice_sent, DateTime.now
    change_column_default :jobs, :job_start_datetime, DateTime.now
  end
end
