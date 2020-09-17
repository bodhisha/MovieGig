Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  get "home/index"
  root to: "home#index"

  resources :movies, only: [:show] do
    resources :watched_movies
    resources :wish_lists
  end
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
