Rails.application.routes.draw do
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
    resources :foods
    resources :food_menus
    resources :purchase_orders
    patch 'rekomendasikan_pr/:id', to: "purchase_requests#accept_pr", as: :rekomendasikan_pr
      patch 'tolak_pr/:id', to: "purchase_requests#reject_pr", as: :tolak_pr
  end


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
