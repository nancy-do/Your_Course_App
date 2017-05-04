Rails.application.routes.draw do


  root 'static_pages#home'
  get  '/category',    to: 'static_pages#category'
  get  '/messages',  to: 'static_pages#messages'
  
  get  '/locations',   to: 'locations#index'
  get  '/create_location', to: 'locations#new'
  post  '/create_location', to: 'locations#create'
  
  get '/categories', to: 'categories#index'
  get  '/create_category', to: 'categories#new'
  post  '/create_category', to: 'categories#create'
  
  get '/courses', to: 'courses#show'
  get 'courses/update'
  get '/create_course', to: 'courses#new'
  post '/create_course', to: 'courses#create'
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users

end
