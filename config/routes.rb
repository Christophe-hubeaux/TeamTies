Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "users/registrations" }
  root "pages#home"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  resources :games, only: %i[index new create] do # /games GET user-games index, /games/new GET games new, /game/new POST games create
    resources :users_games, only: %i[new create]
    resources :teams, only: [:index]
    resources :matches, only: [:index] do
      resources :pronostics, only: %i[create update]
    end
    member do
      get :dashboard
      get :ranking
#       get :join
    end
  end

  namespace :admin do 
    resources :matches, only: [:index, :edit, :update]
  end

  namespace :organisateur do
    resources :games, only: [:edit] do # /organisateur/games/edit
      resources :departments, only: [:create]
    end
  end
  
  resources :chats, only: :show do
    resources :messages, only: [:create]
  end

  get 'join_game/:code', to: 'games#join', as: :join_game
  get '/games/check_code', to: 'games#check_code', as: 'games_check_code' 
end
