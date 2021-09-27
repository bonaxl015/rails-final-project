class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def create
    current_user.follow(@user)
    redirect_to profile_path(@user) if session[:relationship_previous_controller] == 'devise' && session[:relationship_previous_action] == 'profile'
    redirect_to user_search_posts_path(username: session[:username], commit: session[:commit]) if session[:relationship_previous_controller] == 'posts' && session[:relationship_previous_action] == 'user_search'
  end

  def destroy
    current_user.unfollow(@user)
    redirect_to profile_path(@user) if session[:relationship_previous_controller] == 'devise' && session[:relationship_previous_action] == 'profile'
    redirect_to user_search_posts_path(username: session[:username], commit: session[:commit]) if session[:relationship_previous_controller] == 'posts' && session[:relationship_previous_action] == 'user_search'
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
