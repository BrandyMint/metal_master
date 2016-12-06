Rails.application.routes.draw do
  root 'welcome#index'

  resources :orders
  resources :machines
  resources :order_machines
  resources :order_machine_usages
  resources :order_machine_usage_intervals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
