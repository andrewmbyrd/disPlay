class System < ApplicationRecord
  belongs_to :company
  has_many :games
end
