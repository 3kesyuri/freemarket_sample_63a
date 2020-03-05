Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :products, only: [:index]
  resources :tests, only: [:index, :create]
  resources :destinations, only: [:create, :update]
  resources :users, only: [:show, :update] do
    resources :destinations, only: [:index]
    resources :credits, only: [:new, :show],shallow: true
  end

  

  

end
