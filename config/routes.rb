Rails.application.routes.draw do
  get 'sessions/new'

  resources :purchase_requests
 
  resources :positions
  resources :departments
  resources :stations
  resources :religions
  resources :educations
  resources :genders
  resources :users

  resources :items
  resources :item_units
  resources :item_categories
  resources :suppliers
  
  root 'login#new'
  get 'login/index'

  get    '/login',   to: 'login#new'
  post   '/login',   to: 'login#create'
  delete '/logout',  to: 'login#destroy'

  namespace :admin do
    resources :employees
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
