class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :code, :null => false
      t.string :title, :null => false
      t.references :manager, index: true, foreign_key: true, :null => false
      t.references :exec, index: true, foreign_key: true, :null => false
      t.string :openning_order_number
      t.date :openning_order_date
      t.string :closure_act_number
      t.date :closure_act_date
      t.date :completion_date
      t.references :workflow, index: true, foreign_key: true, :null => false

      t.timestamps null: false
    end
  end
end
