class AddAuthorToDeployments < ActiveRecord::Migration
  def change
    add_column :deployments, :author_name, :string
    add_column :deployments, :author_email, :string
  end
end
