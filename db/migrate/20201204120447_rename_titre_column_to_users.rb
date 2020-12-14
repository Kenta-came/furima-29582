class RenameTitreColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :nick_name, :nickname
  end
end
