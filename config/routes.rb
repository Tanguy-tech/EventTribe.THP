Rails.application.routes.draw do

  namespace :admin do
      resources :users
      resources :attendances
      resources :events

      root to: "users#index"
    end
  resources :charges

  resources :admins, only: [:index] do
    resources :users
    root 'admins#index'
  end
  root 'events#index'
  resources :events do
    resources :attendances, only: [:index, :new, :create]
  end
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
