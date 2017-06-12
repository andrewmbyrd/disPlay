class SystemPurchasesController < ApplicationController
  before_action :require_sign_in
  before_action :verify_user, only: [:destroy]

  def show
    @library = Library.find(params[:library_id])
    @system_purchase = @library.system_purchases.where(id: params[:id])[0]
  end

  def create
    @system = System.find(params[:system_id])
    SystemPurchase.create!(library_id: current_user.id,
                           system_id: @system.id)
    flash[:notice] = "#{@system.name} added to your library!"
    redirect_to [@system]
  end

  def destroy
    @library = Library.find(params[:library_id])
    @system_purchase = @library.system_purchases.where(id: params[:id])[0]

    if @system_purchase.destroy
      flash[:notice] = "The #{@system_purchase.system.name} was removed from your library"
      redirect_to @library
    else
      flash.now[:alert] = "There was an error removing this system from your library"
      render :show
    end

  end

  private
  def verify_user
    @library = Library.find(params[:library_id])
    unless current_user == @library.user
      flash[:alert] = "Hey don't try to edit other people's libraries!"
      redirect_to current_user
    end
  end

end
