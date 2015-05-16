class CreateWorkflows < ActiveRecord::Migration
  def change
    create_table :workflows do |t|
      t.integer :idx, :null => false
      t.string :title, :null => false
      t.string :short_title, :null => false
      t.references :manager, index: true, foreign_key: true, :null => false
      t.references :exec, index: true, foreign_key: true, :null => false

      t.timestamps null: false
    end
  end
end
