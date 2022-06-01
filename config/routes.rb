Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: :create
  post 'signup' => 'users#create'
  post 'signin' => 'users#login'
  post 'forgotten-password' => 'passwords#forgot'
  post 'reset-password' => 'passwords#reset'

  resources :requests, except: [:show]
  get 'requests/:lat/:lng' => 'requests#index', :constraints => {:lat => /\-?\d+(.\d+)?/, :lng => /\-?\d+(.\d+)?/}
  get 'user-requests' => 'requests#index_user_requests'

  # action cable
  resources :chats, only: [:index, :create]
  resources :messages, only: [:create, :update]
  mount ActionCable.server => '/cable'
end
