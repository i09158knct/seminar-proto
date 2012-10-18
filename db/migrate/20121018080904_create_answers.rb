class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title
      t.integer :gist_id
      t.text :file_names
      t.text :description
      t.integer :challenge_id
      t.integer :user_id

      t.timestamps
    end
  end
end
