module SystemHelper

  def user_owns_system(system)
    !current_user.library.systems.where(id: system.id).empty?
  end

end
