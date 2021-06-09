Rails.application.routes.draw do
  devise_for :users
  root to: "task_groups#index"
  resources :users, only: %i[show edit update]
end
