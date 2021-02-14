class AddNullFalse < ActiveRecord::Migration[6.1]
  def change
  
    change_column_null :businesses, :mailing_zip, null: false
    change_column_null :businesses, :phone, null: false
    change_column_null :businesses, :ein, null: false
    
    change_column_null :invoices, :date_invoice_sent, null: false
    change_column_null :invoices, :invoice_amount, null: false

    change_column_null :jobs, :job_start_datetime, null: false
    change_column_null :jobs, :job_end_datetime, null: false
    change_column_null :jobs, :total_amount, null: false
    change_column_null :jobs, :amount_paid, null: false
    change_column_null :jobs, :balance, null: false
    change_column_null :jobs, :tax_rate, null: false
    change_column_null :jobs, :deposit_date, null: false
    change_column_null :jobs, :paid_date, null: false
    change_column_null :jobs, :due_date, null: false

    change_column_null :users, :phone, null: false
    change_column_null :users, :zip, null: false
    change_column_null :users, :ssn, null: false

  end
end
