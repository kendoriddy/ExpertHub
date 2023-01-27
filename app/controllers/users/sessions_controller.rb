class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  private

  def respond_with(_resource, _opts = {})
    self.resource = warden.authenticate!(scope: :user, username: params[:username], password: params[:password])
    login_success && return if current_user

    login_failed
  end

  def login_success
    render json: {
      message: 'You are logged In',
      user: current_user,
      token: request.env['warden-jwt_auth.token'],
      status: 200
    }, status: :ok
  end

  def login_failed
    render json: {
      message: 'Invalid username or password',
      status: 401
    }, status: :unprocessable_entity
  end

  def respond_to_on_destroy
    authenticate_user!
    log_out_success
  end

  def log_out_success
    render json: {
      message: 'You are logged out',
      status: 204
    }, status: :ok
  end

  def log_out_failure
    render json: {
      message: 'something went wrong'
    }, status: :unauthorized
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
