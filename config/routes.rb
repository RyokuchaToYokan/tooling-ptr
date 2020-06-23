Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions',
}

  root to: "tops#index"
  resources :tops, only: [:index, :show]
  resources :users, only: [:edit, :show, :update]
  resources :rooms, except: [:show] do
    resources :chats, only: [:index, :create]
    namespace :api do
      resources :chats, only: :index, defaults: { format: 'json' }
    end
  end
  resources :posts, except: :index do
    collection do
      get 'get_child_categories', defaults:      { format: 'json' }
      get 'get_grandchild_categories', defaults: { format: 'json' }
    end
  end

  resources :categories, only: [:show]
  resources :subcategories, only: [:show]
end
