Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  root to: "task_groups#index"
  resources :users, only: %i[new show edit update]
  resources :task_groups, only: %i[new create edit update destroy] do
    resources :spaces, only: %i[index create edit update destroy] do
      resources :tasks, only: %i[index create edit update destroy]
    end
  end
end
