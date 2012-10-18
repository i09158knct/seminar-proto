class Answer < ActiveRecord::Base
  attr_accessible :challenge_id, :description, :file_names, :gist_id, :title, :user_id
end
