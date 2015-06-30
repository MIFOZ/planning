class AddColumnsToHumanBean < ActiveRecord::Migration
  def change
    add_column :human_beans, :email, :string
    add_column :human_beans, :password_salt, :string
  end
end
