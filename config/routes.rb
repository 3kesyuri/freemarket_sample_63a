Rails.application.routes.draw do
  devise_for :users
  root "products#new"
  resources :tests, only: [:index, :create]
  resources :destinations, only: [:create, :update]
  resources :categories, only: [:index]
  resources :products, only: [:index, :new, :create]
  resources :users, only: [:show, :edit, :update] do
    resources :destinations, only: [:index]
    resources :credits, only: [:new, :show],shallow: true
  end
end
