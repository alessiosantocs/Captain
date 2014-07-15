class AddDescriptionToPullRequest < ActiveRecord::Migration
  def change
    add_column :pull_requests, :description, :text
  end
end
