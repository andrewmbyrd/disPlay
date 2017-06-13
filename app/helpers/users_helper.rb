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

  def most_active_followings
    User.select("users.id, count(events.id) AS event_count")
        .where(id: current_user.active_relationships.pluck(:followed_id))
        .joins(:events)
        .group("users.id")
        .order("event_count DESC")
        .limit(5)
  end

  def biggest_users
    User.select("users.id, count(events.id) AS event_count")
        .joins(:events)
        .group("users.id")
        .order("event_count DESC")
        .limit(5)

  end
end
