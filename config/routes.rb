Rails.application.routes.draw do
  resources :blogs
  root to: "pages#home"
  get 'users/profile', as: 'user_root'
  devise_for :users, controllers: { registrations: "users/registrations" }
end
