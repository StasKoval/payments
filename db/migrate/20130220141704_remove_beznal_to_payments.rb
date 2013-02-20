class RemoveBeznalToPayments < ActiveRecord::Migration
  def up
    remove_column :payments, :beznal
  end

  def down
    add_column :payments, :beznal, :boolean
  end
end
