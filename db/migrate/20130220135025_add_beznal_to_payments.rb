class AddBeznalToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :beznal, :boolean
  end
end
