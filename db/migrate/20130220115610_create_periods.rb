class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.integer :value

      t.timestamps
    end
  end
end
