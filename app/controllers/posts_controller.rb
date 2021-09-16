class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[edit update destroy]

  def index
    @post = current_user.posts.build
    @posts = Post.all.order(created_at: :desc).includes(:user)
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

  def edit; end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path, notice: 'Your post was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(current_user.username), notice: 'Your post was successfully removed.' }
      format.json { head :no_content }
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
