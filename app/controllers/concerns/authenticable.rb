module Authenticable
  # Devise methods override
  def current_api_user
    @current_api_user = Admin.find_by(auth_token: request.headers['Authorization'])
  end

  def authenticate_with_token!
    render json: { errors: "Not authenticated" },
                status: :unauthorized unless api_user_signed_in?
  end

  def api_user_signed_in?
    current_api_user.present?
  end

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
