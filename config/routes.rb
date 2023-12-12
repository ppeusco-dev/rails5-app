Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root 'posts#index'
  resources :comments
  resources :posts
  resources :users
end

