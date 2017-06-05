class GamePurchasesController < ApplicationController

  def create
    @system = System.find(params[:system_id])
    @game = Game.find(params[:game_id])
    GamePurchase.create!(library_id: current_user.id,
                           game_id: @game.id,
                           review: nil,
                           rating: nil)
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
      flash[:notice] = "Review posted!"
      redirect_to library_game_purchase_path(@library.id, @game_purchase.id)
    end
  end

  def destroy
    @library = Library.find(params[:library_id])
    @game_purchase = @library.game_purchases.where(id: params[:id])[0]

    if @game_purchase.destroy
      flash[:notice] = "#{@game_purchase.game.title} removed from your library"
      redirect_to @library
    else
      flash.now[:alert] = "There was an error removing this game from your library"
      render :show
    end
  end

end
