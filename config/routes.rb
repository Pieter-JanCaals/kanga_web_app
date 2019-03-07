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

  resources :order_drinks, only: [:update, :destroy]

  get 'orders/:id/confirm', to: 'orders#confirm', as: 'confirm_order'
  get 'orders/:id/summary', to: 'orders#summary', as: 'summary_order'
  get 'notification', to: 'pages#notification', as: 'notification'
  post 'orders/:id/complete', to: 'orders#complete', as: 'orders_complete'
  get 'pages/confirmation_2', to: 'pages#confirmation_2', as: 'confirmation_2'

end
