class CurrentUserController < ApplicationController
  def index
    render json: current_user, status: :ok
  end

  def show
  end
end
