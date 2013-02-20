class AddPeriodIdToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :period_id, :integer
    add_index :payments, :period_id
  end
end
