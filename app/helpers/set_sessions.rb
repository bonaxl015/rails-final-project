module SetSessions
  def post_session
    session[:post_previous_controller] = controller_name
    session[:post_previous_action] = action_name
  end

  def relationship_session
    session[:relationship_previous_controller] = controller_name
    session[:relationship_previous_action] = action_name
  end

  def user_search_session
    session[:username] = params[:username]
    session[:commit] = params[:commit]
  end
end
