class AddSumToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :sum, :string
  end
end
