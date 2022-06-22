Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: %i[new index create] do
    member do
      post '/likes', to: 'likes#create'
      delete '/likes', to: 'likes#destroy'
      resources :comments, only: [:create]
    end
  end
  root "posts#index"
end
