class Company < ApplicationRecord
  has_many :publications
  has_many :games, through: :publications

  has_many :systems
end
