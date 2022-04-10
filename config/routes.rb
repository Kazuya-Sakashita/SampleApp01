Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  root 'posts#index'
  resources :posts, shallow: true do
    resource :bookmarks, only: [:create, :destroy]
    collection do
      get :bookmarks
    end
  end
  resource :homes
  resources :mypages

  get 'mypages/:id/state', to: 'mypages#post_state', as: 'post_state'
end
