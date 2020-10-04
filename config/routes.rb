Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  get "home/index"
  root to: "home#index"

  resources :movies, only: [:show] do
    resources :watched_movies
    resources :wish_lists
    resources :recommended_movies
    resources :reviews
  end
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
