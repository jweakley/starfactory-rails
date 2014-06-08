Starfactory::Application.routes.draw do

  concern :votable do
    resources :votes, only: [:create, :destroy]
  end

  get 'logout' => 'sessions#destroy', as: 'logout'
  get 'login' => 'sessions#new', as: 'login'
  get 'register' => 'users#new', as: 'register'

  resources :users
  resources :sessions
  resources :events, only: [:index, :show]
  resources :instructor_profiles, path: 'instructors', only: [:index, :show]
  resources :student_profiles, path: 'students', only: [:show, :edit, :update]
  resources :tracks, only: [:index, :show]
  resources :workshops, concerns: :votable, only: [:index, :show]

  scope :admin do
    get '' => 'admin#index', as: 'admin'
    get 'events' => 'admin#events', as: 'admin_events'
    get 'instructors' => 'admin#instructors', as: 'admin_instructors'
    get 'tracks' => 'admin#tracks', as: 'admin_tracks'
    get 'students' => 'admin#students', as: 'admin_students'
    get 'workshops' => 'admin#workshops', as: 'admin_workshops'
    resources :events, except: [:index, :show]
    resources :instructor_profiles, path: 'instructors', except: [:index, :show]
    resources :student_profiles, path: 'students', except: [:show, :edit, :update]
    resources :tracks, except: [:index, :show]
    resources :workshops, except: [:index, :show]
  end

  get '403' => 'static#status403', as: 'status_403'
  get '404' => 'static#status404', as: 'status_404'
  get '500' => 'static#status500', as: 'status_500'

  root 'static#index'
  match '*derp', to: 'static#status404', via: '*'
end
