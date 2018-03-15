Rails.application.routes.draw do
  get 'abouts/about_cook'

  get 'abouts/about_delivery'

  get 'abouts/about_health'

  get 'abouts/about_payment'

  get 'withdraw_form/new'

  get 'withdraw_form/create'

  devise_for :admins
  get 'admin' => 'admin#home'

  resources :meals
  resources :orders

  get 'home/index'
  root 'home#index'

  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", confirmations: "users/confirmations",  passwords: "users/passwords", registrations: "users/registrations", unlocks: "users/unlocks"}
  # eg. http://localhost:3000/users/sign_in
  devise_for :cooks, path: 'cooks', controllers: { sessions: "cooks/sessions", confirmations: "cooks/confirmations",  passwords: "cooks/passwords", registrations: "cooks/registrations", unlocks: "cooks/unlocks"}
  # eg. http://localhost:3000/cooks/sign_in


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Fixing no Route to Get sign_out bug
  match '/users/sign_out', to: 'home#index', via: 'get'
  match '/cooks/sign_out', to: 'home#index', via: 'get'

  # stripe ChargesController
  resources :charges

  # Withdraw routes
  match 'withdraw_form/new', to: 'withdraw_form#new', as: 'withdraw_forms_new', via: 'get'
  match 'withdraw_form/create', to: 'withdraw_form#create', as: 'withdraw_forms', via: 'post'
  # resources :withdraw_form, only: [:new, :create]

  #Mailer routes
  match '/contacts', to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]

  # Admin routes
  match '/admin/meals', to: 'admin#meals', as: 'admin_meals', via: 'get'
  match '/admin/orders', to: 'admin#orders', as: 'admin_orders', via: 'get'
  match '/admin/users', to: 'admin#users', as: 'admin_users', via: 'get'
  match '/admin/cooks', to: 'admin#cooks', as: 'admin_cooks', via: 'get'

  # HTTP Verification (file download)
  match '/.well-known/pki-validation/*all', to: 'application#download_file', via: 'get'

  # Contact us form in the Footer
  match '/subscribe_success', to: 'home#subscribe_create', as: 'subscribe_create', via: 'post'

end
