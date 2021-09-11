class DashboardController < ApplicationController
  before_action :authenticate_user!

  def news_feed
    @posts = Post.all.order(created_at: :desc).includes(:user)
  end

  def profile
    @user = User.find_by(id: current_user.id)
    @user_posts = Post.where(user_id: current_user.id).order(created_at: :desc).includes(:user)
  end

  def create_post
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to news_feed_dashboard_index_path }
      else
        format.html { render :news_feed, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def post_params
    params.permit(:caption, :image)
  end
end
