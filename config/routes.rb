Rails.application.routes.draw do
  get 'buyers/index'
  devise_for :users
  root to: 'items#index'
  
  resources :users 
  resources :items do
    resources :transactions, only: [:index, :new, :create]
  end

end
