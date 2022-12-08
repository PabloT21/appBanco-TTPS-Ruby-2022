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
    get "formAdmin", to: 'admin_form#newForm'
    post "sendAdmin", to: 'admin_form#sendForm'
  end
  
  post "finish", to:"turns#finish" 

  get "profile", to: "dashboard#profile"


  get "formPersonal", to: "user_forms#newPersonal"

  get "listUsers", to:"dashboard#indexUsers"

  # Defines the root path route ("/")
   root "dashboard#main"
end
