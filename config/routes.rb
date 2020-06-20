Rails.application.routes.draw do
  devise_for :users
  root to: "tops#index"
  resources :users, only: [:edit, :show, :update]
  resources :rooms, only: [:index, :new, :create] do
    resources :chats, only: [:index, :create]
    namespace :api do
      resources :chats, only: :index, defaults: { format: 'json' }
    end
  end
  resources :posts, except: :show do
    collection do
      get 'get_child_categories', defaults: { format: 'json' }
      get 'get_grandchild_categories', defaults: { format: 'json' }
    end
  end
end
