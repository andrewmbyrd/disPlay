class UsersController < ApplicationController
  before_action :authenticate_user!

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
    unless @user.valid_password?(auth_password)
      flash[:alert] = "Incorrect password"
      redirect_to users_edit_path
    else
      if new_password == new_password_confirm && !new_password.empty?
        @user.password = new_password
        notice += "Password updated. "
      end
      unless new_username.empty?
        @user.username = new_username
        notice += "Username updated."
      end
      begin
        @user.save!
      rescue ActiveRecord::RecordInvalid => e
        flash[:alert] = e.message
        redirect_to users_edit_path
        return
      end
        bypass_sign_in(@user)
        flash[:notice] = notice
        redirect_to users_show_path

    end
  end


end
