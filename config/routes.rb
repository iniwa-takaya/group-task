Rails.application.routes.draw do
  devise_for :users
  root to: "task_groups#index"
  resources :users, only: %i[show edit update]
  resources :task_groups, only: %i[new create] do
    resources :spaces, only: %i[index create]
  end
end
