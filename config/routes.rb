Rails.application.routes.draw do


  get 'categories/new'

  get 'categories/show'

  get 'categories/create'

  root 'static_pages#home'
  get  '/category',    to: 'static_pages#category'
  get  '/messages',  to: 'static_pages#messages'
  
  get  '/locations',   to: 'locations#show'
  get  '/createlocation', to: 'locations#new'
  post  '/createlocation', to: 'locations#create'
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
end
