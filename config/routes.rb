Rails.application.routes.draw do


  root 'static_pages#home'
  get  '/category',    to: 'static_pages#category'
  get  '/messages',  to: 'static_pages#messages'
  
  get  '/locations',   to: 'locations#show'
  get  '/create_location', to: 'locations#new'
  post  '/create_location', to: 'locations#create'
  
  get '/categories', to: 'categories#show'
  get  '/create_category', to: 'categories#new'
  post  '/create_category', to: 'categories#create'
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
end
