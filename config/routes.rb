Rails.application.routes.draw do
  root 'home#index'


  get "/auth/github/callback", to: "sessions#create"

  delete "/login", to: "sessions#logout", as: "logout"


  resources :products do
    resources :reviews, only: [:new, :create]
    resources :orders, only: [:index]
    post "/cart", to: "orders#add_product_order", as: "add_to_cart"
  end

  post "/products/:id", to: "products#update_availability", as: "update_availability"



  resources :vendors, only: [:index] do
    get '/products', to: 'products#index'
  end
  get '/vendor', to: 'vendors#show', as: 'vendor'

  get "vendors/account", to: "vendors#account", as: "vendor_account"

  resources :categories, only: [:index, :new, :create] do
    get '/products', to: 'products#index'
  end

  resources :orders



end
