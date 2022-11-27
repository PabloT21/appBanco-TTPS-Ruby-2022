Rails.application.routes.draw do
  devise_for :users
  resources :horarios
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end
  


  # Defines the root path route ("/")
   root "dashboard#main"
end
