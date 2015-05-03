class AddHumanBeanIdToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :human_bean, index: true, foreign_key: true
  end
end
