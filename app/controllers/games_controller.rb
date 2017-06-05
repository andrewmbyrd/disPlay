class GamesController < ApplicationController
  before_action :require_sign_in
  def show
    @system = System.find(params[:system_id])
    @game = Game.find(params[:id])
  end
end
