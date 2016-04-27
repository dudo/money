Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # require 'sidekiq/web'
  devise_for :users

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root to: "pages#index"
  resources :users do
    root to: "users#show"
  end
  resources :buckets
  resources :financial_authentications

  authenticate :admin do
    # mount Sidekiq::Web => '/sidekiq'
  end
end