Rails.application.routes.draw do
  
  root to: "homes#top"
  
  resources :movies, only:[:index, :show]
  
  resources :reviews do
    patch '/:review_id/hidden' => "reviews#hidden"
    resources :comments,only:[:create,:destroy]
  end
  
  get 'user' => "users#show"
  get 'user/edit' => "users#edit"
  patch 'user/edit' => "users#update"
  get '/user/unsubscribe' => 'users#unsubscribe'
  patch '/user/withdraw' => 'users#withdraw'
  
  namespace :admin do
  
    resources :users, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :destroy]
  
  end
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
end
