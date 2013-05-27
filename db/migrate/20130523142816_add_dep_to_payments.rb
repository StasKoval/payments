class AddDepToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :department, :string
  end
end
