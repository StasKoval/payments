class AddCachToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :cach, :boolean
  end
end
