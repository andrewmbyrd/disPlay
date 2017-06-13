class GamePurchase < ApplicationRecord
  belongs_to :game
  belongs_to :library
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
end
