Rails.application.routes.draw do
  root 'welcome#index'

  resources :work_dates
  resources :intervals
  resources :machines
  resources :orders do
    resources :order_machine_usages do
      resources :order_machine_usage_intervals
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
