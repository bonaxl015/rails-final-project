class CustomFailure < Devise::FailureApp
  def redirect_url
    static_home_path
  end

  def respond
    http_auth? ? http_auth : redirect
  end
end
