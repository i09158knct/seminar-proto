class Challenge < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :tag_list

  belongs_to :user
  has_many :answers

  validates :title,
    :presence => true
  validates :description,
    :presence => true
  validates :user_id,
    :presence => true

  acts_as_taggable

  def user_can_edit?(user)
    self.user_id == user.id
  end
end
