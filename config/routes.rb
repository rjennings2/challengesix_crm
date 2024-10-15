Rails.application.routes.draw do
  resources :customers do
    collection do
      get 'missing_email'
      get 'alphabetized'
      get 'all', to: 'customers#index'
    end
  end

  root 'customers#index'

  # Remove Devise routes
  # devise_for :admin_users, ActiveAdmin::Devise.config

  # Define custom routes for login/logout
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'create_login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
