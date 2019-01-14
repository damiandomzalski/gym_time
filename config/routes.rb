Rails.application.routes.draw do
  root 'pages#index'
  resources :pages
  resources :dashboards
  resources :trainers
  resources :orders
  resources :users

  devise_for :users
end
