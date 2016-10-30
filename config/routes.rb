Rails.application.routes.draw do
  root to: "pages#home"
  get 'users/profile', as: 'user_root'
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users, shallow: true do
    resources :blogs
  end
end
