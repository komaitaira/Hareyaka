Rails.application.routes.draw do
  root 'home#top'
  get 'about/vision' => 'home#vision'
  get 'about/solution' => 'home#solution'
  get 'about/challenge' => 'home#challenge'
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
    get 'mypage' => 'companies#show'
    get 'mypage/edit' => 'companies#edit'
    patch 'mypage' => 'companies#update'
    get 'unsubscribe' => 'companies#unsubscribe'
    put 'unsubscribe' => 'companies#hide'
    resources :articles
  end

  #個人会員側ルーティング
  devise_for :users, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }
  scope module: :public do
    get 'mypage' => 'users#show'
    get 'mypage/edit' => 'users#edit'
    patch 'mypage' => 'users#update'
    get 'unsubscribe' => 'users#unsubscribe'
    put 'unsubscribe' => 'users#hide'
    resources :companies, only: [:show]
    resources :articles, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
    end
  end
end
