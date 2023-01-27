class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { code:200, message: 'Signed up successfully.', data: resource }
    else
      render json: {
        status: { message: 'User could not be created, try again.', errors: resource.errors.full_messages }, status: :unprocessable_entity
      }
    end
  end

end
