Rails.application.routes.draw do
  
  get 'users/new'

  root 'static_pages#home'
  get  '/category',    to: 'static_pages#category'
  get  '/locations',   to: 'static_pages#locations'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
end
