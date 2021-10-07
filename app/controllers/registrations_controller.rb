class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      response_to_sign_up_failure resource
    end
  end

  private

  def response_to_sign_up_failure(resource)
    if !check_attributes(resource)
      redirect_to root_path, alert: 'Please fill in the form'
    elsif User.pluck(:email).include? resource.email
      redirect_to root_path, alert: 'Email already exists. Please use a different one.'
    end
  end

  def check_attributes(resource)
    resource.attributes.all? do |k, v|
      %w[id profile_pic created_at updated_at].include?(k) || v.present?
    end
  end

  protected

  def after_sign_up_path_for(_resource)
    posts_path
  end

  def after_update_path_for(_resource)
    sign_in_after_change_password? ? profile_path(current_user.username) : new_session_path(resource_name)
  end
end
