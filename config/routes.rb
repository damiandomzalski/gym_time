Rails.application.routes.draw do
  root 'pages#index'
  resources :pages
  resources :dashboards
  resources :trainers
  
  devise_for :users
end
