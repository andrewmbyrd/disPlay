class SystemPurchase < ApplicationRecord
  belongs_to :system
  belongs_to :library
end
