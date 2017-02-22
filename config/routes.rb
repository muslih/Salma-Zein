Rails.application.routes.draw do
  resources :food_menus
  resources :foods
  get 'sessions/new'
  
  root 'login#new'
  get 'login/index'

  get    '/login',   to: 'login#new'
  post   '/login',   to: 'login#create'
  delete '/logout',  to: 'login#destroy'

  namespace :admin do
    resources :employees
    resources :users
    resources :positions
    resources :departments
    resources :religions
    resources :educations
    resources :genders
    resources :suppliers
    resources :stations
    resources :items
    resources :item_categories
    resources :item_units
    resources :purchase_requests
  end

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
