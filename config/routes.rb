Rails.application.routes.draw do
  resources :ingredients
  resources :recipes
  resources :cookbooks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
