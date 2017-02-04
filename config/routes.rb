Rails.application.routes.draw do
  resources :items
  resources :item_units
  resources :item_categories
  resources :suppliers
  resources :employees
  resources :positions
  resources :departments
  resources :stations
  resources :religions
  resources :educations
  resources :genders
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
