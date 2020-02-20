Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'items#index'
  resource :users
  resources :favorites, only: [:index, :create,:destroy]
  resources :favorite_conversations, only: [:index, :create,:destroy]
  resources :notes, only: [:index, :new, :edit, :show, :create, :update, :destroy]
  resources :items do
    member do #Item一覧画面からお気に入り登録をする
      post "add", to: "favorites#create"
    end
  end
  resources :conversations do
    member do #Conversation一覧画面からお気に入り登録をする
      post "add", to: "favorite_conversations#create"
    end
  end
end