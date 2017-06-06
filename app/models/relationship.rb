class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follwer_id, presence: true
  validates :followed_id, presence: true
end
