Rails.application.routes.draw do
  resources :posts, only: %i[new index create]
  root "post#index"
end
