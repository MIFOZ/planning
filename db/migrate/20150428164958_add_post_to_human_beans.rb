class AddPostToHumanBeans < ActiveRecord::Migration
  def change
    add_reference :human_beans, :post, index: true, foreign_key: true
  end
end
