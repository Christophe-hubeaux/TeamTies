Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root "pages#home"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :games, only: %i[index new create] do # /games GET user-games index, /games/new GET games new, /game/new POST games create
    resources :teams, only: [:index]
    resources :matches, only: [:index] do # /games/matchs GET matchs index
      resources :pronostics, only: %i[create update] # /games/matchs POST pronostics create, /games/matchs PATCH pronostics update
    end
    member do
      get :dashboard
      get :ranking
      get :join
    end
  end

  resources :users_games, only: %i[new create]

  namespace :organisateur do
    resources :games, only: [:edit] # /organisateur/games/edit
  end
end
