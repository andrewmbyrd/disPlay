class GamePurchase < ApplicationRecord
  belongs_to :game
  belongs_to :library
  has_many :events
  has_many :comments
end
