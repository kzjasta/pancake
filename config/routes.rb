Rails.application.routes.draw do

  get 'sessions/new'

  root               'static#show'
  get 'signup' =>    'users#new'
  get 'login' =>     'sessions#new'
  post 'login' =>    'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  
  resources :teams do
    resources :players
  end

  resources :fixtures, shallow: true do
    resources :match_sets, shallow: true do
      resources :touches
    end
  end
  
  resources :venues

end
