Rails.application.routes.draw do
  resources :organizations
  resources :tasks
  resources :task_types
  resources :careplans
  resources :clients
  resources :providers
  devise_for :users, :controllers => { :registrations => 'registrations' }
  get '/dashboard', to: 'dashboard#index', as: :dashboard
  get '/clients_datatable', to: 'clients#clients_datatable', as: :clients_datatable
  get '/careplans_datatable', to: 'careplans#careplans_datatable', as: :careplans_datatable
  get '/providers_datatable', to: 'providers#providers_datatable', as: :providers_datatable
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
