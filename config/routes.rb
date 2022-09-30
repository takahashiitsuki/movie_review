Rails.application.routes.draw do
  
  root to: "homes#top"
  
  get 'movies' => "movies#search"

  get 'movies/:id' => "movies#show", as: 'movie'
  
  resources :reviews, only: [:show, :index, :destroy]
  
  get 'reviews/:id/new' => "reviews#new", as: 'new_review'
  post 'reviews' => "reviews#create"
  
  get 'user' => "users#show"
  get 'user/edit' => "users#edit"
  patch 'user/edit' => "users#update"
  get '/user/unsubscribe' => 'users#unsubscribe'
  patch '/user/withdraw' => 'users#withdraw'
  
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
