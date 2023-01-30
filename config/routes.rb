Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  # Defines the root path route ("/")
  root to: "technicians#index"
  resources :technicians, only: [:index, :new, :create,:show, :update,:destroy]
end
