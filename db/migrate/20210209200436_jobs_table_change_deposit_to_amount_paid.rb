class JobsTableChangeDepositToAmountPaid < ActiveRecord::Migration[6.1]
  def change
    change_table :jobs do |t|
      t.rename :deposit, :amount_paid
    end
  end
end
