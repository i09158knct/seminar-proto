class Challenge < ActiveRecord::Base
  attr_accessible :description, :title, :user_id

  belongs_to :user

  validates :title,
    :presence => true
  validates :description,
    :presence => true
  validates :user_id,
    :presence => true

  def can_edit?(user)
    self.user_id == user.id
  end
end
