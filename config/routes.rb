Starfactory::Application.routes.draw do

  get 'logout' => 'sessions#destroy', as: 'logout'  
  get 'login' => 'sessions#new', as: 'login'  
  get 'register' => 'users#new', as: 'register'  

  resources :users
  resources :sessions
  resources :instructor_profiles, path: 'instructors'
  resources :student_profiles, path: 'students'
  resources :tracks
  resources :workshops

  root 'static#index'
end
