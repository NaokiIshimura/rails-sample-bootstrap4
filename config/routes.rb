Rails.application.routes.draw do

  root 'static_pages#home'

  # static_pages
  get 'about' => 'static_pages#about'
  post 'about' => 'static_pages#about'
  get 'help' => 'static_pages#help'
  get 'movie' => 'static_pages#movie'

  # form
  get 'form' => 'form#input'
  get 'form/output' => 'form#input'
  post 'form/output'
  
  # map
  get 'map' => 'map#sample'
  get 'map_filter' => 'map#filter'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
