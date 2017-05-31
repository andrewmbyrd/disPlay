class SystemPurchasesController < ApplicationController

  def create
    @system = System.find(params[:system_id])
    SystemPurchase.create!(library_id: current_user.id,
                           system_id: @system.id)
    flash[:notice] = "#{@system.name} added to your library!"
    redirect_to [@system]
  end

end
