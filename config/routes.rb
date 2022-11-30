Rails.application.routes.draw do
  resources :sucursals
  resources :schedules
  devise_for :users
  resources :horarios
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end
  
  get "createAdmin", to: "user_forms#newAdmin"


  # Defines the root path route ("/")
   root "dashboard#main"
end
