module SystemHelper

  def user_owns_system(system)
    current_user.library.systems.pluck(:system_id).index(system.id)
  end

end
