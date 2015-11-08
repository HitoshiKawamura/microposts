Rails.application.routes.draw do

  get 'edit/new'

  root to:'static_pages#home'
  get 'signup', to:'users#new'
  get 'login', to:'sessions#new'
  get 'edit/new', to:'users#edit'
  post 'login', to:'sessions#create'
  delete'logout', to:'sessions#destroy'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end