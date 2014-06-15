class CreateDeployableApplications < ActiveRecord::Migration
  def change
    create_table :deployable_applications do |t|
      t.string :name
      t.string :repo
      t.string :branch
      t.string :public_token
      t.boolean :installed, :default => false
      t.integer :user_id

      t.timestamps
    end
  end
end
