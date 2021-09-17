class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post
  before_action :find_like, only: :destroy
  include LikesHelper

  def create
    if already_liked?
      flash[:notice] = 'You already liked this.'
    else
      @post.likes.create(user_id: current_user.id)
    end

    redirect_back(fallback_location: posts_path)
  end

  def destroy
    if already_liked?
      @like.destroy
    else
      flash[:notice] = 'You already unliked this.'
    end

    redirect_back(fallback_location: posts_path)
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = @post.likes.find(params[:id])
  end
end
