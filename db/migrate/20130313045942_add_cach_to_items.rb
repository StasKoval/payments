class AddCachToItems < ActiveRecord::Migration
  def change
    add_column :items, :cach, :boolean
  end
end
