Rails.application.routes.draw do

  resources :users,only: [:index,:create] do
    get "/new", to: "users#new"
    get "/show", to: "users#show"
    get "/countpost", to: "users#countpost"
    get "/alluser", to: "users#alluser"
    member do
      patch :ban
    end
  end

  devise_for :users
  root "articles#index"

  resources :articles do
    resources :comments
  end
  resources :articles do
    resources :likes,only: [:create, :destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
