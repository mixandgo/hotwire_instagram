Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: %i[new index create]
  root "post#index"
end
