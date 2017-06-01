class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    notice = ""
    @user = current_user
    auth_password = params[:user][:password]
    new_username = params[:user][:username]
    new_password = params[:user][:password_update]
    new_password_confirm = params[:user][:password_update_confirmation]
    unless auth_password == @user.password
      flash[:alert] = "Incorrect password"
      redirect_to users_edit_path
    else
      if new_password == new_password_confirm && ! new_password.is_blank?
        @user.password = new_password
        notice += "Password updated. "
      end
      unless new_username.is_blank
        @user.username = new_username
        notice += "Username updated."
      end
      flash[:notice] = notice
      redirect_to [@user]
    end
  end

end
