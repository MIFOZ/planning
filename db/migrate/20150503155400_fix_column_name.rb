class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :structure_units, :type, :structure_type
  end
end
