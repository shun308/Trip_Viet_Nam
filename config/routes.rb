Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'items#index'
  resource :users
  resources :items do
    member do #Item一覧画面からお気に入り登録をする
      post "add", to: "favorites#create"
      get 'conversation'
    end
  end
  #個人ページからお気に入りを削除する
  resources :favorites 
end