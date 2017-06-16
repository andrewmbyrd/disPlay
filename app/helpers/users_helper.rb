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

  def people_it_follows
    Relationship.where("follower_id = #{current_user.id}")
  end

  def most_active_followings
    Relationship.select("relationships.followed_id, count(events.id) AS event_count")
                .where("relationships.follower_id = #{current_user.id}")
                .joins("INNER JOIN users on relationships.followed_id = users.id")
                .joins("INNER JOIN events on users.id = events.user_id")
                .group("relationships.followed_id")
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
