module ApplicationHelper
  def display_headers?(current_controller)
    %w[sessions registrations passwords static].any? { |controller| controller.include? current_controller }
  end

  def full_name(user)
    "#{user.first_name.upcase_first} #{user.last_name.upcase_first}"
  end
end
