Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#index"
  resources :tests, only: [:index, :create]
  resources :users, only: [:index ,:show, :update] do
    resources :credits, only: [:index,:new]
    resources :destinations, only: [:index]
  end
end
