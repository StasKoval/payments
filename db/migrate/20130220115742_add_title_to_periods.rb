class AddTitleToPeriods < ActiveRecord::Migration
  def change
    add_column :periods, :title, :string
  end
end
