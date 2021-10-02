class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.new(comment_params.merge(user_id: current_user.id))
    @comments_count = @post.comments.count
    return unless @comment.save

    respond_to do |format|
      format.html { redirect_to posts_path }
      format.js
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Your comment was successfully removed.' }
      format.js
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
