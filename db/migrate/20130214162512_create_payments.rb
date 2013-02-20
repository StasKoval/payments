class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :payer_id
      t.integer :recipient_id
      t.date :payment_date
      t.integer :delay
      t.text :product
      t.boolean :status

      t.timestamps
    end
  end
end
