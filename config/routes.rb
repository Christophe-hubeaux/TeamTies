Rails.application.routes.draw do
  root "pages#home"

  devise_for :users, controllers: { registrations: "users/registrations" }

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :games, only: %i[index new create] do # /games GET user-games index, /games/new GET games new, /game/new POST games create
    resources :users_games, only: %i[new create]
    resources :teams, only: [:index]
    resources :matches, only: [:index] do # /games/matchs GET matchs index
      resources :pronostics, only: %i[create update] # /games/matchs POST pronostics create, /games/matchs PATCH pronostics update
    end
    member do
      get :dashboard
      get :ranking
    end
  end

  

  namespace :organisateur do
    resources :games, only: [:edit] do # /organisateur/games/edit
      resources :departments, only: [:create]
    end
  end

  get 'join_game/:code', to: 'games#join', as: :join_game
  get '/games/check_code', to: 'games#check_code', as: 'games_check_code' 
end
