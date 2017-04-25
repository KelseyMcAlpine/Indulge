Rails.application.routes.draw do

  get '/cart', to: "orders#new", as: "cart"

  get 'reviews/index'

  get 'reviews/new'

  get 'reviews/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    resources :orders, only: [:index]
    post "/cart", to: "orders#add_product_order", as: "add_to_cart"
  end

  root 'products#index'
  post "/products/:id", to: "products#update_availability", as: "update_availability"


  resources :vendors, only: [:index, :show] do
    resources :orders, only: [:index]
  end

  # do
  #   get 'vendors/account/:id/products'
  # end
  get "vendors/account/:id", to: "vendors#account", as: "vendor_account"

  resources :categories, only: [:index, :new, :create] do
    resources :products, only: [:index]
  end



end
