class Library < ApplicationRecord
  belongs_to :user
  has_many :game_purchases
  has_many :system_purchases

  has_many :games, through: :game_purchases
  has_many :systems, through: :system_purchases

  before_save { self.style ||= :Games }

  STYLE = [:Games, :Systems]
  enum style: [:Games, :Systems]
end
