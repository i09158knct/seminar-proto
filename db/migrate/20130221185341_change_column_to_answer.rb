class ChangeColumnToAnswer < ActiveRecord::Migration
  def change
    change_column :answers, :gist_id, :string
  end
end
