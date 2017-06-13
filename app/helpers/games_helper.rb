module GamesHelper
  def user_owns_game(game)
    current_user.library.games.pluck(:game_id).index(game.id)
  end

  def user_owns_system(system)
    current_user.library.systems.pluck(:system_id).index(system.id)
  end

  def avg_review_score(game)
    score = GamePurchase.where(game_id: game.id, library_id: current_user.active_relationships.pluck(:followed_id))
                .average(:rating)
    (score.is_a? BigDecimal) ? score.to_i : nil
  end

  def this_copy_of(game)
    current_user.library.game_purchases.find_by(game_id: game.id)
  end


end
