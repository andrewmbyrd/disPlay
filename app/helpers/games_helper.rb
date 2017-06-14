module GamesHelper
  def user_owns_game(game)
    !current_user.library.games.where(id: game.id).empty?
  end

  def user_owns_system(system)
    !current_user.library.systems.where(id: system.id).empty?
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
