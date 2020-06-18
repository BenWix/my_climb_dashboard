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
    end

    resources :posts

    resources :comments, only: [:create]

    resources :send_comments, only: [:create]


    resources :climbs, only: [:index, :show, :new, :create, :edit, :update] do

      resources :sends, only: [:new]
    end 

    resources :sends, only: [:index, :create]

  end
