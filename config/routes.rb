Rails.application.routes.draw do
  get 'users/profile', as: 'user_root'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
