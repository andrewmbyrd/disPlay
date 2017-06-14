class LibrariesController < ApplicationController
  before_action :require_sign_in
  before_action :verify_user, only: [:edit, :update]


  # GET /libraries/1
  # GET /libraries/1.json
  def show
    @library = Library.find(params[:id])
  end

  # GET /libraries/1/edit
  def edit
    @library = Library.find(params[:id])
    if params[:q] && !params[:q].blank?
      search_string = params[:q].downcase
      @found_games = @library.games.where('lower(title) LIKE ?', "%#{search_string}%")  
    end
  end


  # PATCH/PUT /libraries/1
  # PATCH/PUT /libraries/1.json
  def update
    @library = current_user.library
    @library.update(library_params)
    redirect_to edit_library_path(current_user.library.id)
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def library_params
      params.require(:library).permit(:style, :user_id)
    end

    def verify_user
      @library = Library.find(params[:id])
      unless current_user == @library.user
        flash[:alert] = "Hey don't try to edit other people's libraries!"
        redirect_to current_user
      end
    end



end
