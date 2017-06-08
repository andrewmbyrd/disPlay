class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    Relationship.create!(follower_id: current_user.id, followed_id: params[:followed_id])
    if request.referrer.include?("social")
      redirect_to users_social_path
    else
      redirect_to users_path
    end
  end

  def destroy
    #other_user = Relationship.find(params[:id]).followed
    #current_user.unfollow(other_user)
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    if request.referrer.include?("social")
      redirect_to users_social_path
    else
      redirect_to users_path
    end
  end
end
