Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  resources :users, only: [:show] do
    resource :relationships, only: [:create, :destroy]
  end
end
