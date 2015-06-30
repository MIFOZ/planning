class RemoveColumnsFromHumanBean < ActiveRecord::Migration
  def change
    remove_column :human_beans, :email, :string
    remove_column :human_beans, :password_salt, :string
  end
end
