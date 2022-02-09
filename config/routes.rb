Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root 'posts#index'
  resources :posts
  resource :homes
  resources :mypages



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
