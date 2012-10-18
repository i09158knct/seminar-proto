class Answer < ActiveRecord::Base
  attr_accessible :challenge_id, :description, :gist_id, :title, :user_id

  belongs_to :user
  belongs_to :challenge

  validates :challenge_id,
    :presence => true
  validates :gist_id,
    :presence => true
  validates :title,
    :presence => true
  validates :user_id,
    :presence => true

  def can_edit?(user)
    self.user_id == user.id
  end
end
