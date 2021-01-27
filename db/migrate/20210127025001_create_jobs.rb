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
      t.string :status
    
      t.timestamps
    end
  end
end