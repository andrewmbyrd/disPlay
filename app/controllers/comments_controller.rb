class CommentsController < ApplicationController

  def create

    purchase = GamePurchase.find(params[:id])
    commented_user = purchase.library.user
    Comment.create!(user_id: current_user.id,
                    game_purchase_id: params[:id],
                    body: params[:comment][:body])

    Event.create!(user_id: current_user.id,
                  game_purchase_id: params[:id],
                  commentee: commented_user.id,
                  action: " commented on #{commented_user.username}'s copy of ")
    redirect_to library_game_purchase_path(purchase.library.id, purchase.id)
  end

end
