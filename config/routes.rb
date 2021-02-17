Rails.application.routes.draw do
  devise_for :accounts
  get "u/:utorid" => "public#profile", as: :profile
  resources :courses do
    resources :posts
  end

  resources :subscriptions
  resources :comments, only: [:create]

  root to: "public#index"
end
