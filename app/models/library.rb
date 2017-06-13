class Library < ApplicationRecord
  belongs_to :user
  has_many :game_purchases, dependent: :destroy
  has_many :system_purchases, dependent: :destroy

  has_many :games, through: :game_purchases
  has_many :systems, through: :system_purchases

  before_save { self.style ||= :Systems }

  STYLE = [:Games, :Systems]
  enum style: [:Games, :Systems]
end
