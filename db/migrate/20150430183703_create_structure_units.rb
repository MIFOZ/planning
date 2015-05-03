class CreateStructureUnits < ActiveRecord::Migration
  def change
    create_table :structure_units do |t|
      t.string :name
      t.integer :type
      t.string :code
      t.belongs_to :head
      t.belongs_to :parent

      t.timestamps null: false
    end
  end
end
