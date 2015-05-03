class CreateHumanBeans < ActiveRecord::Migration
  def change
    create_table :human_beans do |t|
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.boolean :is_head
      t.integer :default_deputy
      t.integer :deputy_by_order

      t.timestamps null: false
    end
  end
end
