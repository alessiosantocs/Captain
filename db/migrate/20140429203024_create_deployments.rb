class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
    	
      t.string 	:branch
      t.string 	:environment
      t.string 	:revision
      t.string  :repo

      t.integer :user_id

      t.timestamps
    end
  end
end
