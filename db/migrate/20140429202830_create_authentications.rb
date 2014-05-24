class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :access_token
      t.string :token_secret
      t.string :consumer_key
      t.string :consumer_secret

      t.timestamps
    end
  end
end
