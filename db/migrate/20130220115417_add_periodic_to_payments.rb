class AddPeriodicToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :periodic, :integer
  end
end
