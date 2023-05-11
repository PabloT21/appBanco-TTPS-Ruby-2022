Rails.application.routes.draw do
  resources :turns
  resources :sucursals
  resources :schedules
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end
  
  as :user do
    get "form_admin", to: 'admin_form#new_admin'
    post "send_admin", to: 'admin_form#send_admin_form'

    get "form_empleado", to: 'admin_form#new_empleado'
    post "send_empleado", to: 'admin_form#send_empleado_form'
  end
  
  get "password_form", to: 'dashboard#password_form'

  post "update_password", to: 'dashboard#update_password'

  get "edit_empleado", to: 'dashboard#edit_empleado'
  post "update_sucursal", to: 'dashboard#update_sucursal'

  post "finish", to:"turns#finish" 

  get "profile", to: "dashboard#profile"

  get "list_users", to:"dashboard#index_users"

  # Defines the root path route ("/")
   root "dashboard#main"
end