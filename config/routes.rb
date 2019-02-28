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

  get 'events/:event_id/drinks/api', to: 'drinks#api_drinks_by_category'

end
