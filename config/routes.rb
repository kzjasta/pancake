Rails.application.routes.draw do

  root 'static#home'
  get 'signup' => 'users#new'
  resources :users

end
