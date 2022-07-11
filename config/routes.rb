Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  namespace :api do
    # /api/upload_image
    post :upload_image, to: 'utils#upload_image' 
    # /api/users/:id/follow
    resources :users, only: [] do
      member do
        post :follow
      end
    end

    resources :stories, only: [] do
      # /api/stories/:id/clap
      # /api/stories/:id/bookmark
      member do
        post :clap
        post :bookmark
      end
    end
  end

  resources :users, only: [] do
    collection do
      get :pricing # /users/pricing
      get :payment # /users/payment
      post :pay    # /users/pay
    end
  end
 
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
