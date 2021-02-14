class AddNullFalse < ActiveRecord::Migration[6.1]
  def change
    change_column_null :business, :address_1, null: false
    change_column_null :business, :address_2, null: false
    change_column_null :business, :city, null: false
    change_column_null :business, :zip, null: false
    change_column_null :business, :state, null: false
    change_column_null :business, :mailing_address_1, null: false
    change_column_null :business, :mailing_address_2, null: false
    change_column_null :business, :mailing_city, null: false
    change_column_null :business, :mailing_zip, null: false
    change_column_null :business, :mailing_state, null: false
    change_column_null :business, :url, null: false
    change_column_null :business, :email, null: false
    change_column_null :business, :phone, null: false, limit: 15
    change_column_null :business, :description, null: false
    change_column_null :business, :ein, null: false
    
    change_column_null :invoices, :job_id, null: false
    change_column_null :invoices, :user_id, null: false
    change_column_null :invoices, :date_invoice_sent, null: false
    change_column_null :invoices, :invoice_amount, null: false

    change_column_null :jobs, :job_start_datetime, null: false
    change_column_null :jobs, :job_end_datetime, null: false
    change_column_null :jobs, :address_1, null: false
    change_column_null :jobs, :address_2, null: false
    change_column_null :jobs, :city, null: false
    change_column_null :jobs, :zip, null: false
    change_column_null :jobs, :state, null: false
    change_column_null :jobs, :description, null: false
    change_column_null :jobs, :total_amount, null: false
    change_column_null :jobs, :amount_paid, null: false
    change_column_null :jobs, :balance, null: false
    change_column_null :jobs, :tax_rate, null: false
    change_column_null :jobs, :deposit_date, null: false
    change_column_null :jobs, :paid_date, null: false
    change_column_null :jobs, :due_date, null: false
    change_column_null :jobs, :admin_id, null: false
    change_column_null :jobs, :client_id, null: false

    change_column_null :payments, :amount, null: false
    change_column_null :payments, :business_id, null: false
    change_column_null :payments, :job_id, null: false
    change_column_null :payments, :admin_id, null: false
    change_column_null :payments, :client_id, null: false
    change_column_null :payments, :contractor_id, null: false
    change_column_null :payments, :payment_type, null: false

    change_column_null :users, :first_name, null: false
    change_column_null :users, :last_name, null: false
    change_column_null :users, :email, null: false
    change_column_null :users, :phone, null: false
    change_column_null :users, :address_1, null: false
    change_column_null :users, :address_2, null: false
    change_column_null :users, :city, null: false
    change_column_null :users, :zip, null: false
    change_column_null :users, :state, null: false
    change_column_null :users, :ssn, null: false
    change_column_null :users, :admin_id, null: false
    change_column_null :users, :client_id, null: false
    change_column_null :users, :contractor_id, null: false  
  end
end
