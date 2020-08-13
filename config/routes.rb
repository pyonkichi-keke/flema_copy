Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resources :users, only: [:show]

  resources :addresses, only: [:new, :create, :edit, :update]

  resources :credit_cards, only: [:new, :create] do
    collection do
      post 'delete', to: 'credit_cards#delete'
    end 
  end


  resources :products do
    resources :purchases, only: [:show] do
      collection do
        post 'pay', to: 'purchases#pay'
      end
    collection do
      get 'search'
    end
  end
end

  root 'products#index'

end
