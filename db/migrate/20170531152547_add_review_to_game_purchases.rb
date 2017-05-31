class AddReviewToGamePurchases < ActiveRecord::Migration[5.0]
  def change
    add_column :game_purchases, :review, :string
  end
end
