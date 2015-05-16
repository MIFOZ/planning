class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :type, :null => false
      t.references :workflow, index: true, foreign_key: true, :null => false
      t.references :order, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.string :title, :null => false
      t.references :created_by, index: true, foreign_key: true, :null => false
      t.integer :state, :default => 0
      t.string :comment, :null => false
      t.datetime :creation_date, :null => false

      t.timestamps null: false
    end
  end
end
