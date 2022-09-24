Rails.application.routes.draw do
  devise_for :users
  resources :entities
  resources :categories
  resources :users
  unauthenticated :user do
    root to: 'users#index'
  end

  authenticated do
    root 'categories#index', as: :authenticated_root
  end

end
