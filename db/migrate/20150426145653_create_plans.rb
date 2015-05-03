class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :work_type
      t.string :workflow
      t.integer :workflow_section
      t.integer :work_id
      t.string :name
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
