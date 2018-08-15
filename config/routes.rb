Rails.application.routes.draw do
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

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
