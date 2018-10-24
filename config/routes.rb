Rails.application.routes.draw do
  root "application#hello"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  resources :users
  namespace :admin do
    resources :books
  end
end