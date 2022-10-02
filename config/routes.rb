Rails.application.routes.draw do

  resources :users,only: [:index] do
    member do
      patch :ban
    end
  end

  devise_for :users
  root "articles#index"

  resources :articles do
    resources :comments
    get "/Manage", to: "articles#manageUser"
    member do
      patch :deactivate
    end
  end
  resources :articles do
    resources :likes,only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
