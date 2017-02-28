Rails.application.routes.draw do

  get 'sessions/new'

  root               'static#home'
  get 'signup' =>    'users#new'
  get 'login' =>     'sessions#new'
  post 'login' =>    'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  
  resources :teams do
    resources :players
  end

  resources :fixtures do
    resources :match_sets
  end
  
  resources :venues

end
