Rails.application.routes.draw do
  root 'shelters#index'
  resources :shelters, only: [:index, :show]
  resources :evacuees, only: [:new, :create]
end
