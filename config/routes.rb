Rails.application.routes.draw do
  devise_for :users

  root to: "posts#index"
  get '/posts/category/:id', to: "posts#category"
  resources :posts do
    resources :comments, only: :create
    get :search, on: :collection
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: :show
end
