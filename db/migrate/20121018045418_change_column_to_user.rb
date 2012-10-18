class ChangeColumnToUser < ActiveRecord::Migration
  def change
    change_column :users, :provider, :string, :null => false
    change_column :users, :uid, :string, :null => false
    change_column :users, :name, :string, :null => false
  end
end
