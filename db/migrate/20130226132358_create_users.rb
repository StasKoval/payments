class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :oauth_expires_at
      t.string :oauth_token
      t.string :provider
      t.integer :uid
      t.string :email

      t.timestamps
    end
  end
end
