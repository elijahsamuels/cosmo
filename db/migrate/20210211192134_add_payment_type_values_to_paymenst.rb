class AddPaymentTypeValuesToPaymenst < ActiveRecord::Migration[6.1]
  def change
    change_table(:payments) do |t|
      t.string :payment_type
    end
  end
end
