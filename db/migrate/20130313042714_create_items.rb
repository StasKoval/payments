class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.date :date
      t.integer :payment_id
      t.boolean :status

      t.timestamps
    end
  end
end
