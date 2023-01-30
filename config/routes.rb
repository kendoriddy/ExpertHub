Rails.application.routes.draw do
  get 'current_user/index'
  get 'current_user/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  resources :current_user, only: [:index, :show]

  # Defines the root path route ("/")
  root to: "home#index"
end
