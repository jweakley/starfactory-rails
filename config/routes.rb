Starfactory::Application.routes.draw do

  concern :votable do
    resources :votes, only: [:create, :destroy]
  end

  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'login' => 'sessions#new', as: 'login'
  get 'register' => 'users#new', as: 'register'

  resources :users
  resources :sessions
  resources :events
  resources :instructor_profiles, path: 'instructors'
  resources :student_profiles, path: 'students'
  resources :tracks
  resources :workshops, concerns: :votable

  scope :admin do
    get '' => 'admin#index', as: 'admin'
    get 'events' => 'admin#events', as: 'admin_events'
    get 'instructors' => 'admin#instructors', as: 'admin_instructors'
    get 'tracks' => 'admin#tracks', as: 'admin_tracks'
    get 'students' => 'admin#students', as: 'admin_students'
    get 'workshops' => 'admin#workshops', as: 'admin_workshops'
  end

  get '403' => 'static#status403', as: 'status_403'
  get '404' => 'static#status404', as: 'status_404'
  get '500' => 'static#status500', as: 'status_500'

  root 'static#index'
  match '*', to: 'static#status404', via: '*'
end
