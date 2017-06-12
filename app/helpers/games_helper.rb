module GamesHelper
  def user_owns_game(game)
    current_user.library.games.pluck(:game_id).index(game.id)
  end

  def user_owns_system(system)
    current_user.library.systems.pluck(:system_id).index(system.id)
  end

  def avg_review_score(game)
    sum = 0
    num = 0
    current_user.active_relationships.each do |rel|
      followeds_game = User.find(rel.followed_id).library.game_purchases.find_by(game_id: @game.id)
      if followeds_game
        sum += followeds_game.rating if followeds_game.rating.is_a? Numeric
        num += 1
      end
    end

    num > 0 ? sum / num : nil
  end


end
