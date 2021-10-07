class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def profile
    @comment = Comment.new
    @user = User.friendly.find(params[:id])
    @user_posts = Post.where(user_id: @user).order(created_at: :desc).includes(:user)
    @user_events = Event.all.includes(:user)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username first_name last_name slug profile_pic])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username first_name last_name slug profile_pic])
  end

  def after_sign_in_path_for(_resource)
    current_user.roles.any? { |r| r.role == 'Admin' } ? rails_admin_path : posts_path
  end

  rescue_from CanCan::AccessDenied do |e|
    redirect_to main_app.root_path, alert: e.message
  end
end
