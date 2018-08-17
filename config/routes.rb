Rails.application.routes.draw do

  # available resources
  resource :user_sessions, only: [:new, :create, :destroy]

  resources :users

  # default route
  root 'static_pages#home'

  get 'user_sessions/new'

  get 'user_sessions/create'

  get 'user_sessions/destroy'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/show'

  get 'users/update'

  get '/home', to: 'static_pages#home'

  get '/help', to: 'static_pages#help'

  # authlogic authentication
  get '/sign_up', to: 'users#new', as: :sign_up

  get '/sign_in', to: 'user_sessions#new', as: :sign_in

  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
