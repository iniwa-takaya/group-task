Rails.application.routes.draw do
  devise_for :users
  root to: "task_groups#index"
  resources :users, only: %i[show edit update]
  resources :task_groups, only: %i[new create edit update destroy] do
    resources :spaces, only: %i[index create edit update destroy] do
      resources :tasks, only: %i[index create edit update]
    end
  end
end
