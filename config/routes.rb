Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  scope "(:locale)", locale: /en|vi/ do
    root "cosmetics#index"
    mount Ckeditor::Engine => "/ckeditor"
    get "/home", to: "static_pages#home"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    devise_scope :user do
      get "/signup", to: "devise/registrations#new", as: :signup
    end
    resources :cart_items
    resources :orders
    resources :users do
      resources :favorite_cosmetics, only: [:index]
    end
    resources :emotions, only: [:destroy, :create]
    resources :blogs
    resources :cosmetics, only: [:index, :show]
    resources :emotions, only: [:destroy, :create]
    resources :authors, only: [:index]
    namespace :admin do
      resources :cosmetics
      resources :users, except: [:edit]
      resources :authors, only: [:index]
      resources :xmls, only: [:index]
    end
    resources :cosmetics do
      resources :comments
      collection {post :search, to: "cosmetics#index"}
    end
  end
end
