class FixTimeConsumingToLaborContentPlannedInTask < ActiveRecord::Migration
  def change
    rename_column :tasks, :time_consuming, :labor_input_planned
    add_column :tasks, :labor_input_actual, :integer
    rename_column :tasks, :continuance, :duration_planned
    add_column :tasks, :duration_actual, :float
    rename_column :tasks, :planned_begin, :begin_planned
    rename_column :tasks, :planned_end, :end_planned
    add_column :tasks, :begin_actual, :date
    add_column :tasks, :end_actual, :date
  end
end
