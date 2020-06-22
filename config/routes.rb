Rails.application.routes.draw do
  root to: "welcome#home"
  
  devise_for :users, :controllers => {:registrations => "registrations", omniauth_callbacks: "callbacks"}
    devise_scope :user do 
      get 'login', to: 'devise/sessions#new'
    end
    devise_scope :user do 
      get 'signup', to: 'devise/registrations#new'
    end

    resources :users, only: [:show, :edit, :update] do 

      resources :posts, only: [:index, :new, :create]
      resources :sends, only: [:index, :show, :delete] 
      resources :hangboards, only: [:index, :show, :new]
    end
    resources :hangboards, only: [:create, :edit, :update, :destroy]
    resources :posts

    resources :comments, only: [:create]

    resources :sends, only: [:edit, :update, :destroy]

    resources :exercises, only: [:edit, :update, :delete]

    resources :climbs, only: [:index, :show, :new, :create, :edit, :update] do

      resources :sends, only: [:new]
    end 

    resources :sends, only: [:index, :create]

  end
