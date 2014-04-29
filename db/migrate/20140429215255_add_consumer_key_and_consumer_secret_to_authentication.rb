class AddConsumerKeyAndConsumerSecretToAuthentication < ActiveRecord::Migration
  def change
    add_column :authentications, :consumer_key, :string
    add_column :authentications, :consumer_secret, :string
  end
end
