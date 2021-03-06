class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[edit update destroy]
  include UserFilter

  def index
    @post = current_user.posts.build
    @comment = Comment.new
    @posts = Post.all.order(created_at: :desc).includes(:user)
    @events = Event.all.includes(:user)
  end

  def create
    @post = current_user.posts.build(post_params)
    @posts_count = Post.all.count
    @comment = Comment.new
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path }
        format.js
      else
        format.html { redirect_to posts_path, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    session[:post_index] = params[:post_index]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @comment = Comment.new
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_back(fallback_location: posts_path) }
        format.js
      else
        format.html { redirect_back(fallback_location: posts_path, status: :unprocessable_entity) }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_back(fallback_location: posts_path) }
      format.js
    end
  end

  def user_search
    return unless params[:username]

    @user_query = params[:username].downcase
    @user = User.where('username ILIKE ? OR first_name ILIKE ? OR last_name ILIKE ?', "%#{@user_query}%", "%#{@user_query}%", "%#{@user_query}%")
    @user_ordinary = filter_ordinary_user(@user)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:caption, :image)
  end
end
