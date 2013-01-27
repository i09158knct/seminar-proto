class Review < ActiveRecord::Base
  attr_accessible :answer_id, :body, :gist_commit_id, :gist_id, :targets, :user_id
  serialize :targets, JSON

  belongs_to :user
  belongs_to :answer

  validates :answer_id,
    :presence => true
  validates :body,
    :presence => true
  validates :user_id,
    :presence => true

  def user_can_edit?(user)
    self.user_id == user.id
  end
end
