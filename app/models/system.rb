class System < ApplicationRecord
  belongs_to :company
  has_many :releases
  has_many :games, through: :releases
  has_many :system_purchases
  has_many :libraries, through: :system_purchases
end
