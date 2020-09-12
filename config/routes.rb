Rails.application.routes.draw do

  root 'home#top'
  get 'guide' => 'home#guide'
  get 'thanks' => 'home#thanks'

  #管理者側ルーティング
  devise_for :admins, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }
  devise_scope :admin do
    post 'admins/guest_sign_in', to: 'admin/sessions#new_guest' # 管理者ゲストログイン
  end
  namespace :admin do
    delete 'destroy_all_notifications' => 'notifications#destroy_all'
    resources :users, only: [:index, :show, :edit, :update]
    resources :companies, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
    resources :articles, only: [:index, :show, :edit, :update, :destroy]
    resources :notifications, only: :index
  end

  #法人会員側ルーティング
  devise_for :companies, controllers: {
    sessions:      'corporate/sessions',
    passwords:     'corporate/passwords',
    registrations: 'corporate/registrations'
  }
  devise_scope :company do
    post 'companies/guest_sign_in', to: 'corporate/sessions#company_guest' # 法人ゲストログイン
  end
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
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#user_guest' # 個人ゲストログイン
  end
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
