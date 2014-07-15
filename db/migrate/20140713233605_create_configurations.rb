class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.string :key
      t.string :value
      t.references :owner, polymorphic: true

      t.timestamps
    end
  end
end