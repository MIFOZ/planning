class AddColumnToUser < ActiveRecord::Migration
  def change
    add_reference :users, :human_bean, index: true, foreign_key: true
  end
end
