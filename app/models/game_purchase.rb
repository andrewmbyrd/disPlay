class GamePurchase < ApplicationRecord
  belongs_to :game
  belongs_to :library
end
