class AddTokenSecretToAuthentication < ActiveRecord::Migration
  def change
    add_column :authentications, :token_secret, :string
  end
end
