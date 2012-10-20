SeminarProto::Application.routes.draw do
  match "users/", :to => "users#index"
  get "users/:id", :to => "users#show"

  resources :challenges do
    resources :answers
  end

  root :to => "home#index"

  match "/auth/github/callback" => "sessions#callback"
  match "/logout" => "sessions#destroy", :as => :logout
end
