Rails.application.routes.draw do
  
  root to: "homes#top"
  
  get 'movies/search' => "movies#search"

  get 'movies/show' => "movies#show"
  
  get 'mypage' => "user/homes#top"
  
  get 'mypage/edit' => "user/homes#edit"
  update 'mypage/edit' => "user/homes#update"
  
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
