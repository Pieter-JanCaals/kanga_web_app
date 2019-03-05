Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#splash'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events, only: [:index, :show] do
    resources :drinks, only: [:index]
  end

  resources :orders, except: [:index, :create, :new] do
    resources :drinks, only: [] do
      resources :order_drinks, only: [:create, :update, :destroy]
    end
  end

  get 'orders/:id/confirm', to: 'orders#confirm', as: 'confirm_order'
  get 'orders/:id/review', to: 'orders#review', as: 'review_order'

  get 'orders/:id/split_tab', to: 'orders#split_tab', as: 'split_tab'
  post 'orders/:id/confirm_split_tab', to: 'orders#confirm_split_tab', as: 'confirm_split_tab'

end
