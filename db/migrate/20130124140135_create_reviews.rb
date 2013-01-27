class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :answer_id, :null => false
      t.integer :user_id, :null => false
      t.integer :gist_id
      t.string :gist_commit_id
      t.text :targets
      t.text :body, :null => false

      t.timestamps
    end
  end
end
