Rails.application.routes.draw do
  resources :posts
  root to: "pages#home"
  get 'users/profile', as: 'user_root'
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users do
    resources :blogs
  end
end
