class GamePurchasesController < ApplicationController
  before_action :require_sign_in

  def create
    @system = System.find(params[:system_id])
    @game = Game.find(params[:game_id])
    purchase = GamePurchase.create!(library_id: current_user.library.id,
                           game_id: @game.id,
                           review: nil,
                           rating: nil)
    Event.create!(user_id: current_user.id,
                  action: "added this to their library: ",
                  game_purchase_id: purchase.id)

    flash[:notice] = "#{@game.title} added to your library!"
    redirect_to [@system]
  end

  def show
    @library = Library.find(params[:library_id])
    @game_purchase = @library.game_purchases.where(id: params[:id])[0]
  end

  def update
    @library = Library.find(params[:library_id])
    @game_purchase = @library.game_purchases.where(id: params[:id])[0]
    @game_purchase.review = params[:game_purchase][:review]
    score =params[:game_purchase][:rating]
    @game_purchase.rating = score.to_i unless score == '-'
    if @game_purchase.save!
      Event.create(user_id: current_user.id,
                   action: "reviewed ",
                   game_purchase_id: @game_purchase.id)
      flash[:notice] = "Review posted!"
      redirect_to library_game_purchase_path(@library.id, @game_purchase.id)
    end
  end

  def destroy
    @library = Library.find(params[:library_id])
    @game_purchase = @library.game_purchases.where(id: params[:id])[0]
    Event.create!(user_id: current_user.id,
                  action: "removed this from their library: ",
                  game_purchase_id: @game_purchase.id)

    if @game_purchase.destroy
      flash[:notice] = "#{@game_purchase.game.title} removed from your library"
      redirect_to @library
    else
      flash.now[:alert] = "There was an error removing this game from your library"
      render :show
    end
  end

end
