module UserFilter
  def filter_ordinary_user(user)
    user_ordinary = []

    user.each do |u|
      user_ordinary << u unless User.find(u.id).roles.where(role: 'Admin').present? || User.find(u.id).roles.where(role: 'Moderator').present?
    end

    return nil if user_ordinary.empty?
    user_ordinary
  end
end
