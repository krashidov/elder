Rails.application.routes.draw do
  resources :organizations
  resources :tasks
  resources :task_types
  resources :careplans
  resources :clients
  resources :providers
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
