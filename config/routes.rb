Rails.application.routes.draw do
  root 'shelters#index'
  resources :shelters, only: [:index, :show]
  resources :evacuees, only: [:new, :create]
  post 'evacuees/register', to: 'evacuees#register', as: :evacuees_register
end
