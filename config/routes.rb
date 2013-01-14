SeminarProto::Application.routes.draw do
  get "search/search"

  get "/search", :to => "search#show"

  get "management/index", :as => "management"

  match "users/", :to => "users#index", :as => "users"
  get "users/:id", :to => "users#show", :as => "user"

  resources :challenges do
    resources :answers
  end
  post "/create_gist", :to => "answers#create_gist"

  root :to => "home#index"

  match "/auth/github/callback" => "sessions#callback"
  match "/logout" => "sessions#destroy", :as => :logout
end
