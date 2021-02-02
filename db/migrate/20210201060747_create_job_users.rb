class CreateJobUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :job_users, id: false do |t|

      t.bigint :job_id
      t.bigint :user_id

      t.timestamps
    end
  end
end
