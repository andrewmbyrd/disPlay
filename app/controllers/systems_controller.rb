class SystemsController < ApplicationController
  before_action :require_sign_in
  def index
    @systems = System.all
  end

  def show
    @system = System.find(params[:id])
  end


end
