Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :stories do
    resources :comments, only: [:create]
  end

  # /@username/文章標題-123
  get '@:username/:story_id', to: 'pages#show', as: 'story_page'

  # /@username/
  get '@:username', to: 'pages#user', as: 'user_page'

  get '/demo', to: 'pages#demo'
  root 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
