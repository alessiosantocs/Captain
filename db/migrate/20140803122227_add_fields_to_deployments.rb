class AddFieldsToDeployments < ActiveRecord::Migration
  def change
    add_column :deployments, :title, :string
    add_column :deployments, :description, :text
  end
end
