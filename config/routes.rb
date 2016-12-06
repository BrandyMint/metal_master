Rails.application.routes.draw do
  resources :intervals
  root 'welcome#index'

  resources :machines
  resources :orders do
    resources :order_machine_usages do
      resources :order_machine_usage_intervals
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
