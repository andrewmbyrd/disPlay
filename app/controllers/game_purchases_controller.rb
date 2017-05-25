class GamePurchasesController < ApplicationController

  def create
    @system = System.find(params[:system_id])
    @game = Game.find(params[:game_id])
    GamePurchase.create!(library_id: current_user.id,
                           game_id: @game.id)
    flash[:notice] = "#{@game.title} added to your library!"
    redirect_to [@system]
  end

end
