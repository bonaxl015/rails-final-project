class DashboardController < ApplicationController
  before_action :authenticate_user!

  def news_feed
    @posts = Post.all.order(created_at: :desc).includes(:user)
  end

  def profile
    @user = User.find_by(id: current_user.id)
    @user_posts = Post.where(user_id: current_user.id).order(created_at: :desc).includes(:user)
  end
end
