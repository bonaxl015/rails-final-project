class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def profile
    @user = User.find(params[:id])
    @user_posts = Post.where(user_id: params[:id]).order(created_at: :desc).includes(:user)
  end

  def relationships
    @user = User.find(params[:id])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username first_name last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username first_name last_name])
  end

  def after_sign_in_path_for(_resource)
    news_feed_dashboard_index_path
  end

  rescue_from CanCan::AccessDenied do |e|
    redirect_to main_app.root_path, alert: e.message
  end
end
