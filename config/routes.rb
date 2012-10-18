SeminarProto::Application.routes.draw do
  resources :challenges do
    resources :answers
  end

  root :to => "home#index"

  match "/auth/github/callback" => "sessions#callback"
  match "/logout" => "sessions#destroy", :as => :logout
end
