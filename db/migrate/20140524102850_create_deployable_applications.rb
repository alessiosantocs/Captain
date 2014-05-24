class CreateDeployableApplications < ActiveRecord::Migration
  def change
    create_table :deployable_applications do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end