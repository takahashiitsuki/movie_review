Rails.application.routes.draw do
  
  root to: "homes#top"
  
  get 'movies' => "movies#search"

  get 'movies/:id' => "movies#show"
  
  get 'user' => "users/user#show"
  get 'user/edit' => "users/user#edit"
  patch 'user/edit' => "users/user#update"
  get '/user/unsubscribe' => 'users/user#unsubscribe'
  patch '/user/withdraw' => 'users/user#withdraw'
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
