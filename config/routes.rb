Rails.application.routes.draw do
  get 'reviews/index'

  get 'reviews/new'

  get 'reviews/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :products
  post "/products/:id", to: "products#update_availability", as: "update_availability"

  resources :vendors, only: [:index, :show]
  get "vendors/account/:id", to: "vendor#account", as: "vendor_account"

  resources :categories, only: [:index, :new, :create] do
    resources :products, only: [:index]
  end



end
