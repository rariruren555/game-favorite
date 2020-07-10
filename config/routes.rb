Rails.application.routes.draw do

  get 'posts/index'
  root to: "posts#index"
  resources :posts, only: [:new, :create]

end
