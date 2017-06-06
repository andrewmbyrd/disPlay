class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    other_user = User.find(params[:followed_id])
    current_user.follow(other_user)
    redirect_to users_index_path

  end

  def destroy
    other_user = Relationship.find(params[:id]).followed
    current_user.unfollow(other_user)
    redirect_to users_index_path
  end
end
