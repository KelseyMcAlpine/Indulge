Rails.application.routes.draw do
  get 'reviews/index'

  # get 'reviews/new'

  # get 'reviews/create'

  resources :products do
    resources :reviews, only: [:new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
  root 'home#index'
  post "/products/:id", to: "products#update_availability", as: "update_availability"


  resources :vendors, only: [:index, :show] do
    get '/products', to: 'products#index'
  end


  get "vendors/account/:id", to: "vendors#account", as: "vendor_account"


  resources :categories, only: [:index, :new, :create]


  get '/categories/:category_id/products', to: "categories#product_list", as: "category_products"

end
