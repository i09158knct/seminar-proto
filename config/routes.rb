SeminarProto::Application.routes.draw do
  get "management/index", :as => "management"

  match "users/", :to => "users#index", :as => "users"
  get "users/:id", :to => "users#show", :as => "user"

  resources :challenges do
    resources :answers
  end

  root :to => "home#index"

  match "/auth/github/callback" => "sessions#callback"
  match "/logout" => "sessions#destroy", :as => :logout
end
