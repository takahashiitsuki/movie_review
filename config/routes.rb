Rails.application.routes.draw do
  
  resources :reviews, only: [:show, :index, :destroy]
  
  root to: "homes#top"
  
  get 'movies' => "movies#search"

  get 'movies/:id' => "movies#show", as: 'movie'
  
  get 'reviews/:id/new' => "reviews#new", as: 'new_review'
  post 'reviews' => "reviews#create"
  
  get 'user' => "users/users#show"
  get 'user/edit' => "users/users#edit"
  patch 'user/edit' => "users/users#update"
  get '/user/unsubscribe' => 'users/users#unsubscribe'
  patch '/user/withdraw' => 'users/users#withdraw'
  
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
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
