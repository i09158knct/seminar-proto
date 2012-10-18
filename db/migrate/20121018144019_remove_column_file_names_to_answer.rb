class RemoveColumnFileNamesToAnswer < ActiveRecord::Migration
  def change
    remove_column :answers, :file_names
  end
end
