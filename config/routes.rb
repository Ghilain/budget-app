Rails.application.routes.draw do
  resources :categories
  devise_for :users
  unauthenticated :user do
    root to: 'users#index'
  end

  authenticated :user do
    root 'groups#index', as: :authenticated_root
  end

  resources :groups
  resources :entities
end
