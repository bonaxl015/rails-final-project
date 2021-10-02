class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post
  before_action :find_like, only: :destroy
  include LikesHelper

  def create
    session[:post_index] = params[:post_index]
    if already_liked?
      flash[:notice] = 'You already liked this.'
    else
      @post.likes.create(user_id: current_user.id)
    end
    respond_to do |format|
      format.html { redirect_back(fallback_location: posts_path) }
      format.js
    end
  end

  def destroy
    session[:post_index] = params[:post_index]
    if already_liked?
      @like.destroy
    else
      flash[:notice] = 'You already unliked this.'
    end
    respond_to do |format|
      format.html { redirect_back(fallback_location: posts_path) }
      format.js
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end
end
