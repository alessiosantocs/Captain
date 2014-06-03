class CreatePullRequests < ActiveRecord::Migration
  def change
    create_table :pull_requests do |t|
      t.integer	:pid
      t.string 	:title
      t.string 	:created_on
      t.string 	:merged_on
      
      t.integer	:deployment_id

      t.timestamps
    end
  end
end
