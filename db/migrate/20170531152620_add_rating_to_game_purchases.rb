class AddRatingToGamePurchases < ActiveRecord::Migration[5.0]
  def change
    add_column :game_purchases, :rating, :integer
  end
end
