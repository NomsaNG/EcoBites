Rails.application.routes.draw do
  get 'orders/create'
  get 'orders/index'
  get 'orders/show'
  get 'orders/destroy'
  get 'offers/index'
  get 'offers/show'
  get 'offers/new'
  get 'offers/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home"
  resources :offers, only: [:index, :show, :new, :create] do
    resources :orders, only: [:create]
  end
  resources :orders, only: [:index, :show, :destroy]
end
