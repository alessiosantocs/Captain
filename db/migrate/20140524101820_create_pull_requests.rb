class CreatePullRequests < ActiveRecord::Migration
  def change
    create_table :pull_requests do |t|
      t.integer	:pid
      t.string 	:title
      
      t.integer	:deployable_application_id

      t.timestamps
    end
  end
end