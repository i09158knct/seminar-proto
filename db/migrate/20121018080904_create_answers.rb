class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title, :null => false
      t.integer :gist_id
      t.text :file_names
      t.text :description
      t.integer :challenge_id
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
