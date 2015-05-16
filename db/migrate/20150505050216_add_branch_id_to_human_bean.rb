class AddBranchIdToHumanBean < ActiveRecord::Migration
  def change
  	add_reference :human_beans, :branch, index: true, foreign_key: true
  end
end
