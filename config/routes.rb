Rails.application.routes.draw do
  resources :posts
  resources :comments

  root 'post#index'
end
