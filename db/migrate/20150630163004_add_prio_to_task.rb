class AddPrioToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :prio, :integer, :null => false, :default => 0
  end
end
