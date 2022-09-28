Rails.application.routes.draw do

  # root 'users#index'
  # devise_for :users

  root to: redirect('/articles')

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users  
  resources :articles do
    resources :comments
  end
  resources :friends 
  resources :friend_requests do
     collection do
       get "accept_friend"
       get "decline_friend"
     end
  end
end

