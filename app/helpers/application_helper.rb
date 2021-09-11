module ApplicationHelper
  def display_headers?(current_controller)
    %w[sessions registrations passwords static].any? { |controller| controller.include? current_controller }
  end
end
