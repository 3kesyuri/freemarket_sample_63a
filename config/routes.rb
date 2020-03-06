Rails.application.routes.draw do
  devise_for :users
  root "products#new"
  resources :tests, only: [:index, :create]
  resources :destinations, only: [:create, :update]
  resources :products, only: [:new, :create]
  resources :users, only: [:show, :update] do
    resources :credits, only: [:index,:new]
    resources :destinations, only: [:index]
  end
end
