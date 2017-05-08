Rails.application.routes.draw do


  get 'ratings/create'

  root 'static_pages#home'
  get  '/messages',  to: 'static_pages#messages'
  
  get  '/locations',   to: 'locations#index'
  get  '/location',   to:'locations#show'
  get  '/create_location', to: 'locations#new'
  post  '/create_location', to: 'locations#create'
  
  get '/categories', to: 'categories#index'
  get '/category', to: 'categories#show'
  get  '/create_category', to: 'categories#new'
  post  '/create_category', to: 'categories#create'
  
  get '/courses', to: 'courses#show'
  get 'courses/edit'
  get '/create_course', to: 'courses#new'
  post '/create_course', to: 'courses#create'
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :locations
  resources :courses
  resources :categories
  
  resources :ratings do 
    member do 
      get :like
      get :dislike
    end 
  end
  

end
