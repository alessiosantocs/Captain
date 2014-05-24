class CreateDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
    	
      # Deploy stuff
      t.string 	:branch
      t.string 	:environment
      t.string 	:revision
      t.string  :repo

      # Each deploy is associated to an app
      t.integer :deployable_application_id

      t.timestamps
    end
  end
end
