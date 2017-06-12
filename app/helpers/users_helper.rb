module UsersHelper
  def num_following
    @user.active_relationships.length
  end

  def num_followers
    @user.passive_relationships.length
  end

  def relationship_for(user)
    current_user.active_relationships.find_by(followed_id: user.id)
  end
end
