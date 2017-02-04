Rails.application.routes.draw do
  root 'login#index'

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
