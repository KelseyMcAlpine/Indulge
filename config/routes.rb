Rails.application.routes.draw do

  get '/cart', to: "orders#new", as: "cart"

  get 'reviews/index'

  # get 'reviews/new'

  # get 'reviews/create'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :products do
    resources :reviews, only: [:new, :create]

    resources :orders, only: [:index]
    post "/cart", to: "orders#add_product_order", as: "add_to_cart"
  end

  post "/products/:id", to: "products#update_availability", as: "update_availability"


  resources :vendors, only: [:index, :show] do
<<<<<<< HEAD
    get '/products', to: 'vendors#show'
  end

=======
    resources :orders, only: [:index]
  end
>>>>>>> km-cart

  get "vendors/account/:id", to: "vendors#account", as: "vendor_account"


  resources :categories, only: [:index, :new, :create]


  get '/categories/:category_id/products', to: "categories#product_list", as: "category_products"

end
