Rails.application.routes.draw do
  root 'home#index'
  get 'reviews/index'

  # get 'reviews/new'

  # get 'reviews/create'

  resources :products do
    resources :reviews, only: [:new, :create]
    resources :orders, only: [:index]
    post "/add", to: "orders#add_product_order", as: "add_to_cart"
    post "/remove", to: "orders#remove_product_order", as: "remove_from_cart"
  end

  post "/products/:id", to: "products#update_availability", as: "update_availability"


  resources :vendors, only: [:index, :show] do
    get '/products', to: 'vendors#show'
    get '/orders', to: "orders#manage_orders", as: "manage_orders"
    get '/orders/:id', to: "orders#order_details", as: "order_details"

  end

  get "vendors/account/:id", to: "vendors#account", as: "vendor_account"

  resources :categories, only: [:index, :new, :create]
  resources :orders do
    get '/checkout', to: "orders#checkout", as: "checkout"
    post '/purchase', to: "orders#update", as: "purchase"
  end


  get '/categories/:category_id/products', to: "categories#product_list", as: "category_products"

end
