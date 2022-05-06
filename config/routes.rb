Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: :create
  post 'signup' => 'users#create'
  post 'signin' => 'users#login'
  post 'forgotten-password' => 'passwords#forgot'
  post 'reset-password' => 'passwords#reset'
end
