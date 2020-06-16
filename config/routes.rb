Rails.application.routes.draw do
  devise_for :users
  root to: "tops#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:index, :new, :create] do
    resources :chats, only: [:index, :create]
  end
end
