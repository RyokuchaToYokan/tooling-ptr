Rails.application.routes.draw do
  devise_for :users
  root to: "tops#index"
  resources :users, only: [:edit, :update]
  resources :qandarooms, only: [:index, :new, :create]
end
