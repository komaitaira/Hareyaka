Rails.application.routes.draw do

  root 'public/articles#index'
  get 'top' => 'home#top'
  get 'vision' => 'home#vision'
  get 'solution' => 'home#solution'
  get 'challenge' => 'home#challenge'
  get 'thanks' => 'home#thanks'

  #管理者側ルーティング
  devise_for :admins, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :companies, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :articles, only: [:index, :show, :edit, :update]
  end

  #法人会員側ルーティング
  devise_for :companies, controllers: {
    sessions:      'corporate/sessions',
    passwords:     'corporate/passwords',
    registrations: 'corporate/registrations'
  }
  namespace :corporate do
    get 'unsubscribe' => 'companies#unsubscribe'
    put 'unsubscribe' => 'companies#hide'
    delete 'destroy_all_notifications' => 'notifications#destroy_all'
    resources :companies, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get :followers, on: :member # フォロワーのみがDM受信対象
    end
    resources :rooms, only: [:index, :show] # indexがあればいいかも。corporate側は基本的に参照のみなのでcreateは不要
    resources :messages, only: [:create]
    resources :articles
    resources :notifications, only: :index
  end

  #個人会員側ルーティング
  devise_for :users, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }
  scope module: :public do
    get 'unsubscribe' => 'users#unsubscribe'
    put 'unsubscribe' => 'users#hide'
    get 'favorites' => 'articles#favorites'
    delete 'destroy_all_notifications' => 'notifications#destroy_all'
    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get :follows, on: :member
    end
    resources :rooms, only: [:index, :create, :show]
    resources :messages, only: [:create]
    resources :companies, only: [:index, :show] # :showにDM開始ボタン表示
    resources :articles, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
    end
    resources :notifications, only: :index
  end
end
