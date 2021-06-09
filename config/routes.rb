Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  resources :users, only: %i[show edit update]
end
