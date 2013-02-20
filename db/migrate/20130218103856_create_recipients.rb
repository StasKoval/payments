class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :address
      t.string :contacts
      t.string :name

      t.timestamps
    end
  end
end
