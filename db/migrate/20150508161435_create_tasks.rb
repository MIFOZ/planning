class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, :null => false
      t.references :plan, index: true, foreign_key: true, :null => false
      t.references :parent_task, index: true, foreign_key: true
      t.integer :idx, :null => false
      t.integer :time_consuming, :null => false
      t.float :continuance, :null => false
      t.references :exec, index: true, foreign_key: true, :null => false
      t.date :planned_begin, :null => false
      t.date :planned_end, :null => false
      t.integer :state, :null => false
      t.integer :completeness, :null => false

      t.timestamps null: false
    end
  end
end
