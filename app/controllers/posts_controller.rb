class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[edit update destroy]
  include SetSessions

  def index
    post_session
    @post = current_user.posts.build
    @comment = Comment.new
    @posts = Post.all.order(created_at: :desc).includes(:user)
    @events = Event.all.includes(:user)
  end

  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path }
      else
        format.html { redirect_to posts_path, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path if session[:post_previous_action] == 'index' && session[:post_previous_controller] == 'posts'
      redirect_to profile_path(current_user.username) if session[:post_previous_action] == 'profile' && session[:post_previous_controller] == 'devise'
    else
      respond_to do |format|
        format.html { redirect_to posts_path, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path if session[:post_previous_action] == 'index' && session[:post_previous_controller] == 'posts'
    redirect_to profile_path(current_user.username) if session[:post_previous_action] == 'profile' && session[:post_previous_controller] == 'devise'
  end

  def user_search
    @user_ordinary = []
    relationship_session
    return unless params[:username]

    user_search_session
    @user_query = params[:username].downcase
    @user = User.where('lower(username) LIKE ?', "%#{@user_query}%").or(User.where('lower(first_name) LIKE ?', "%#{@user_query}%")).or(User.where('lower(last_name) LIKE ?', "%#{@user_query}%"))
    @user.each do |user|
      @user_ordinary << user unless User.find(user.id).roles.where(role: 'Admin').present? || User.find(user.id).roles.where(role: 'Moderator').present?
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
