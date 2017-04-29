Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/new'

  get 'users/create'

  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user 
  resource :session
end
