class GamesController < ApplicationController
  def show
    @system = System.find(params[:system_id])
    @game = Game.find(params[:id])
  end
end
