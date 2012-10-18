SeminarProto::Application.routes.draw do
  resources :answers

  resources :challenges

  root :to => "home#index"

  match "/auth/github/callback" => "sessions#callback"
  match "/logout" => "sessions#destroy", :as => :logout
end
