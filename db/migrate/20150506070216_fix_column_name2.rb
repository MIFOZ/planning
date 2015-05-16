class FixColumnName2 < ActiveRecord::Migration
  def change
  	rename_column :plans, :type, :work_type
  end
end
