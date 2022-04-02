Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  root 'posts#index'
  resources :posts
  resource :homes
  resources :mypages

  get 'mypages/:id/state', to: 'mypages#post_state', as: 'post_state'
end
