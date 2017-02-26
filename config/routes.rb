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
    resources :purchase_requests do
      resources :purchase_orders
    end
    resources :purchase_orders
    resources :purchase_order_addresses
    resources :foods
    resources :food_menus

    get 'dashboard', to: 'dashboard#index_administrator', as: 'administrator_dash'
    get 'dashboard', to: 'dashboard#index_kitchen', as: 'kitchen_dash'
    get 'dashboard', to: 'dashboard#index_quality_control', as: 'quality_control_dash'
    get 'dashboard', to: 'dashboard#index_logistik', as: 'logistik_dash'
    get 'dashboard', to: 'dashboard#index_administrasi', as: 'administrasi_dash'
    get 'dashboard', to: 'dashboard#index_operational', as: 'operational_dash'

  end


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
