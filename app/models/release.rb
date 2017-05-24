class Release < ApplicationRecord
  belongs_to :game
  belongs_to :system
end
