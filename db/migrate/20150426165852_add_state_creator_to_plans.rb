class AddStateCreatorToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :state, :integer
    add_column :plans, :created_by, :integer
  end
end
