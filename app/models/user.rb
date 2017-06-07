class User < ApplicationRecord
  validates_uniqueness_of :username
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "followed_id",
                                  dependent: :destroy
  has_many :followers, through: :active_relationships

  include Gravtastic
  gravtastic default: "retro", size: 180
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :library
  has_many :events
  has_many :comments

  after_create :make_library

  def following?(other_user)
    active_relationships.pluck(:followed_id).include?(other_user.id)
  end

  private
  def make_library
    self.library = Library.new
  end

end
