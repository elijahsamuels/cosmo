class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.datetime :job_start_datetime
      t.datetime :job_end_datetime
      t.string :address_1
      t.string :address_2
      t.string :city
      t.integer :zip
      t.string :state
      t.string :status, :default => "Inquiry"
      t.text :description
      t.integer :total_amount
      t.integer :deposit
      t.integer :balance
      t.integer :tax_rate
      t.datetime :deposit_date
      t.datetime :paid_date
      t.datetime :due_date

      t.timestamps
    end
  end
end