Rails.application.routes.draw do

  root to: redirect('/signup')

  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :articles do
    resources :comments
  end

end

