Rails.application.routes.draw do
  
  root 'static_pages#home'
  
  #get 'static_pages/home'

  get 'static_pages/category'

  get 'static_pages/locations'

  get 'static_pages/login'

end
