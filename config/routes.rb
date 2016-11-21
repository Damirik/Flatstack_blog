Rails.application.routes.draw do
  root to: "pages#index"
  get "users/profile" => "user_blogs#index", :as => "user_root"
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks",
                                    registrations: "users/registrations" }

  resources :users do
    resources :blogs, shallow: true do
      resources :posts
    end
  end

  resources :posts do
    resources :comments, only: %i(create destroy)
  end
end
