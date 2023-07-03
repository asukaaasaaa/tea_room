Rails.application.routes.draw do
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  namespace :public do
    get 'post_teas/index'
    get 'post_teas/show'
    get 'post_teas/edit'
    get 'post_teas/new'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/likes'
    get 'customers/edit'
    get 'customers/unsubscribe'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
