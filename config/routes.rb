Rails.application.routes.draw do
  get 'lab12/input'
  get 'lab12/show', as: 'show'
  get 'session/login'
  get 'session/create'
  get 'session/logout'
  get 'lab12/show', as: 'output'
  post 'session/login'
  post 'session/create'
  post 'session/logout'

  root 'lab12#input'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
