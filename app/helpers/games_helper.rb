module GamesHelper
  def user_owns_game(game)
    current_user.library.games.pluck(:game_id).index(game.id)
  end

  def user_owns_system(system)
    current_user.library.systems.pluck(:system_id).index(system.id)
  end
end
