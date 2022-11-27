Rails.application.routes.draw do
  devise_for :users
  resources :horarios
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
