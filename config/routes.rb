Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'items#index'
  resource :users
  #個人ページからお気に入りを削除する
  resources :favorites
  resources :favorite_conversations
  resources :notes
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