class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def require_sign_in
    unless current_user
      flash[:alert] = "Please log in before doing that!"
      redirect_to root_path
    end
  end

end
