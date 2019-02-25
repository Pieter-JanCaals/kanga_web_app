Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#splash'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events, only: [:index, :show] do
    resources :drinks, only: [:index]
    resources :order_drinks, only: [:create]
  end

  resources :orders, except: [:index, :create, :new]

end
