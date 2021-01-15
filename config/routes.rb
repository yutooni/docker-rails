Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]
  
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    

  end
  
  
  root "hello#index"

  

  
  
end
