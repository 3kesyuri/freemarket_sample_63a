Rails.application.routes.draw do
  devise_for :users
  root "products#index"
  resources :tests, only: [:index, :create]
  resources :destinations, only: [:create, :update]
  resources :categories, only: [:index]
  
  resources :products, only: [:index, :new, :create] do
    resources :purchases, only: [:index],shallow: true do
      collection do
        get 'index', to: 'purchases#index'
        post 'pay', to: 'purchases#pay'
        get 'done', to: 'purchases#done'
      end
    end
  end
  
  resources :users, only: [:show, :edit, :update] do
    resources :destinations, only: [:index]
    resources :credits, only: [:new, :show],shallow: true do
      collection do
        post 'show', to: 'credits#show'
        post 'pay', to: 'credits#pay'
        post 'delete', to: 'credits#delete'
      end
    end
  end

  

end
