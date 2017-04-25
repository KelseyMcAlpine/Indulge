Rails.application.routes.draw do
  root 'home#index'
  get 'reviews/index'

  # get 'reviews/new'

  # get 'reviews/create'
  get "/auth/github/callback", to: "sessions#create"

  delete "/login", to: "sessions#logout", as: "logout"


  resources :products do
    resources :reviews, only: [:new, :create]
    resources :orders, only: [:index]
    post "/cart", to: "orders#add_product_order", as: "add_to_cart"
  end

  post "/products/:id", to: "products#update_availability", as: "update_availability"

  get '/vendor', to: 'vendors#show', as: 'vendor'

  resources :vendors, only: [:index] do
    get '/products', to: 'vendors#show'
  end

  get "vendors/account/:id", to: "vendors#account", as: "vendor_account"

  resources :categories, only: [:index, :new, :create]
  resources :orders


  get '/categories/:category_id/products', to: "categories#product_list", as: "category_products"

end
