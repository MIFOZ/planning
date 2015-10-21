class FixColumnName3 < ActiveRecord::Migration
  def change
    rename_column :plans, :comment, :commentary
  end
end
