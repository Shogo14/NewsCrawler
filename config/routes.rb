# frozen_string_literal: true

Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'

  constraints ->(request) { request.session[:user_id].present? } do
    # ログインしてる時のパス
    root to: 'news#index'
  end
  # ログインしてない時のパス
  root 'static_pages#home'

  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/testlogin', to: 'sessions#testlogin'
  resources :users
  resources :news
  resources :keywords
  resources :account_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
