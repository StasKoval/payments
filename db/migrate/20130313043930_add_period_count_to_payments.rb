class AddPeriodCountToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :count, :integer
    add_column :payments, :period, :string
  end
end
