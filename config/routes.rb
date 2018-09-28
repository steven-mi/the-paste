Rails.application.routes.draw do

  # available resources
  resource :user_sessions, only: [:new, :create, :destroy]

  resources :users

  resources :projects

  resources :projects do
    resources :posts
  end

  # default route
  root 'projects#index'

  # static pages routes

  get '/home', to: 'static_pages#home'

  get '/help', to: 'static_pages#help'

  # authlogic routes
  get '/sign_up', to: 'users#new', as: :sign_up

  get '/sign_in', to: 'user_sessions#new', as: :sign_in

  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
