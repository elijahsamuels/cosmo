class AddDefaultsEmptyString < ActiveRecord::Migration[6.1]
  def change
      
    change_column_default :businesses, :name, ""
    change_column_default :businesses, :address_1, ""
    change_column_default :businesses, :address_2, ""
    change_column_default :businesses, :city, ""
    change_column_default :businesses, :zip, 0
    change_column_default :businesses, :state, ""
    change_column_default :businesses, :mailing_address_1, ""
    change_column_default :businesses, :mailing_address_2, ""
    change_column_default :businesses, :mailing_city, ""
    change_column_default :businesses, :mailing_zip, 0
    change_column_default :businesses, :mailing_state, ""
    change_column_default :businesses, :url, ""
    change_column_default :businesses, :email, ""
    change_column_default :businesses, :phone, ""
    change_column_default :businesses, :description, ""
    change_column_default :businesses, :ein, ""
        
    change_column_default :invoices, :date_invoice_sent, DateTime.new(2001,1,1,1,0,0)
    change_column_default :invoices, :invoice_amount, 0

    change_column_default :jobs, :job_start_datetime, DateTime.new(2001,1,1,1,0,0)
    change_column_default :jobs, :job_end_datetime, DateTime.new(2001,1,1,1,0,0)
    change_column_default :jobs, :address_1, ""
    change_column_default :jobs, :address_2, ""
    change_column_default :jobs, :city, ""
    change_column_default :jobs, :zip, 0
    change_column_default :jobs, :state, ""
    change_column_default :jobs, :description, ""
    change_column_default :jobs, :total_amount, 0
    change_column_default :jobs, :amount_paid, 0
    change_column_default :jobs, :balance, 0
    change_column_default :jobs, :tax_rate, 0
    change_column_default :jobs, :deposit_date, DateTime.new(2001,1,1,1,0,0)
    change_column_default :jobs, :paid_date, DateTime.new(2001,1,1,1,0,0)
    change_column_default :jobs, :due_date, DateTime.new(2001,1,1,1,0,0)

    change_column_default :payments, :amount, 0

    change_column_default :users, :first_name, ""
    change_column_default :users, :last_name, ""
    change_column_default :users, :email, ""
    change_column_default :users, :phone, ""
    change_column_default :users, :address_1, ""
    change_column_default :users, :address_2, ""
    change_column_default :users, :city, ""
    change_column_default :users, :zip, 0
    change_column_default :users, :state, ""
    change_column_default :users, :ssn, 0
  end
end
