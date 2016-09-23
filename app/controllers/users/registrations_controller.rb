class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  respond_to :json

  def create
    build_resource(sign_up_params)
     resource.save
     yield resource if block_given?
     if resource.persisted?
       if resource.active_for_authentication?
         set_flash_message! :notice, :signed_up
         sign_up(resource_name, resource)
         render :json => resource.as_json(:auth_token=>resource.auth_token, :email=>resource.email), :status=>201
       else
         warden.custom_failure!
         render :json => resource.errors, :status=>422
       end
     else
       warden.custom_failure!
       render :json => resource.errors, :status=>422
     end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
     u.permit(:email, :password, :password_confirmation, :name, :admin)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
     u.permit(:email, :password, :password_confirmation, :name, :admin)
    end
  end
end
