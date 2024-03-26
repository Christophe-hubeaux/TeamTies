Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :games, only: %i[index new create] do
    resources :teams, only: [:index]
    resources :matches, only: [:index] do
      resources :pronostics, only: %i[create update]
    end
    member do
      get :dashboard
      get :ranking
    end
  end

  resources :users_games, only: [:new, :create]

  namespace :organisateur do
    resources :games, only: [:edit]
  end

  resources :chats, only: :show do
    resources :messages, only: [:create]
  end

  get 'join_game/:code', to: 'games#join', as: :join_game
end
