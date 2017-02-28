Rails.application.routes.draw do
  
  
  resources :cycles
  get 'sessions/new'
  
  root 'login#new'
  get 'login/index'

  get    '/login',   to: 'login#new'
  post   '/login',   to: 'login#create'
  delete '/logout',  to: 'login#destroy'

  namespace :admin do
    resources :employees
    resources :users do
      resources :employees
      get 'profile', to: 'users#profile', as: 'profile'   
    end
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
    resources :purchase_orders do
      resources :fund_administrations
    end
    resources :purchase_order_addresses
    resources :foods
    resources :food_menus
    resources :fund_administrations

    get 'dashboard_administrator', to: 'dashboard#index_administrator', as: 'administrator_dash'
    get 'dashboard_kitchen', to: 'dashboard#index_kitchen', as: 'kitchen_dash'
    get 'dashboard_quality_control', to: 'dashboard#index_quality_control', as: 'quality_control_dash'
    get 'dashboard_logistik', to: 'dashboard#index_logistik', as: 'logistik_dash'
    get 'dashboard_administrasi', to: 'dashboard#index_administrasi', as: 'administrasi_dash'
    get 'dashboard_admin', to: 'dashboard#index_admin', as: 'admin_dash'

    patch 'rekomendasikan_pr/:id', to: "purchase_requests#accept_pr", as: :rekomendasikan_pr
    patch 'tolak_pr/:id', to: "purchase_requests#reject_pr", as: :tolak_pr
    patch 'pencatatan_dana/:id', to: "fund_administrations#create", as: :pencatatan_dana
  end


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
