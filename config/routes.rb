Rails.application.routes.draw do
    #会員
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  scope module: :public do
    root to: 'homes#top'
    get '/about', to: 'homes#about'

    get 'customers/mypage' => 'customers#show', as: 'mypage'
    # customers/editはdeviseのルーティングとかぶってしまうため
    get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
    patch 'customers/information' => 'customers#update', as: 'update_information'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    put 'customers/information' => 'customers#update'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customer'

    resources :public do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      member do
        get 'likes' => 'customers#likes'
      end
    end

    resources :post_teas, only: [:new, :index, :show, :edit, :update, :destroy, :create] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

  end
  # ゲストログイン
  devise_scope :customer do
    post "customers/guest_sign_in", to: "customers/sessions#guest_sign_in"
  end

  #管理者
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
