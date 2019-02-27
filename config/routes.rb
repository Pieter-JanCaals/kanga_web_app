Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#splash'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events, only: [:index, :show] do
    resources :drinks, only: [:index]
  end

  post 'orders/:order_id/drinks/:drink_id/order_drinks', to: 'order_drinks#create', as: 'new_order_drink'
  delete 'orders/:order_id/order_drinks/:order_drink_id', to: 'order_drinks#destroy', as: 'destroy_order_drink'

  resources :orders, except: [:index, :create, :new]

end
