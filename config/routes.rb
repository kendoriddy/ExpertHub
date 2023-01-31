Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get 'current_user/index'
  get 'current_user/show'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  resources :current_user, only: [:index, :show]

  # Defines the root path route ("/")
  root to: "technicians#index"
  resources :technicians, only: [:index, :new, :create,:show, :update,:destroy]
  resources :users do
    resources :appointments
  end
  resources :technicians do
    resources :appointments
  end
end
