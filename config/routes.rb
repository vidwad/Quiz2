Rails.application.routes.draw do

  get 'likes/create'
  get 'likes/destroy'
  
    resources :ideas do
    resources :reviews, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    end
    
    root to: "ideas#index"

    resources :users
    resource :session, only: [:new, :create, :destroy]
    
  end