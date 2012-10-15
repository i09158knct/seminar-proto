SeminarProto::Application.routes.draw do
  root :to => "home#index"

  match "/auth/github/callback" => "sessions#callback"
  match "/logout" => "sessions#destroy", :as => :logout
end
