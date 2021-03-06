class Game < ApplicationRecord
  has_many :releases
  has_many :systems, through: :releases
  has_many :game_purchases
  has_many :libraries, through: :game_purchases
end
