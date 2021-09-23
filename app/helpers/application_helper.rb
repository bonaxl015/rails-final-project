module ApplicationHelper
  def display_headers?(current_controller)
    %w[sessions registrations passwords static errors].any? { |controller| controller.include? current_controller }
  end

  def controller_checker(current_controller)
    %w[events posts].any? { |controller| controller.include? current_controller }
  end

  def full_name(user)
    "#{user.first_name.upcase_first} #{user.last_name.upcase_first}"
  end
end
