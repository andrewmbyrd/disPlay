class LibrariesController < ApplicationController
  before_action :require_sign_in


  # GET /libraries/1
  # GET /libraries/1.json
  def show
    @library = Library.find(params[:id])
  end

  # GET /libraries/1/edit
  def edit
    @library = current_user.library
    if params[:q] && !params[:q].blank?
      found = @library.games.pluck(:title).select do |title|
        title.include?(params[:q]) || title.downcase.include?(params[:q])
      end
      @found_games = @library.games.where(title: found)
    end
  end


  # PATCH/PUT /libraries/1
  # PATCH/PUT /libraries/1.json
  def update
    @library = current_user.library
    @library.update(library_params)
    redirect_to edit_library_path(current_user.library.id)
  end

  def destroy
  end

  def add_system(system)
    SystemPurchase.create!(library_id: current_user.library.id, system_id: system.id)
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def library_params
      params.require(:library).permit(:style, :user_id)
    end



end
