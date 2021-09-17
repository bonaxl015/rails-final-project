module LikesHelper
  def already_liked?
    Like.exists?(user_id: current_user.id,
                 post_id: params[:post_id])
  end

  def liker(liked)
    liked.likes.find do |like|
      like.user_id == current_user.id
    end
  end
end
