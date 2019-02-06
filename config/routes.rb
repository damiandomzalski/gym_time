Rails.application.routes.draw do
  root 'pages#index'
  resources :pages
  resources :dashboards do
    collection do
      get :activities
      get :edit_activity
      put :update_activity
      post :attach_trainer_to_activity
      get :products
      get :edit_product
      get :new_product
      put :update_product
      post :create_product
      get :equipments
      get :new_equipment
      post :create_equipment
    end
  end
  resources :trainers
  resources :orders
  resources :profiles

  devise_for :users
end
