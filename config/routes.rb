Rails.application.routes.draw do

  devise_for :users

  resources :blog_posts do
    resources :comments
  end
  resources :comments do
    resources :comments
  end
  resources :public_posts do
    resources :comments
    collection { get :search }
  end
  root to:  'public_posts#index'
end
