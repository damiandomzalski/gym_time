Rails.application.routes.draw do
  root 'pages#index'
  resources :pages
  resources :dashboards do
    collection do
      get :new_product
      post :create_product
    end
  end
  resources :trainers
  resources :orders

  devise_for :users
end
