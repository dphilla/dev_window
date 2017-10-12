Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root "welcome#index"

  get "/auth/:provider/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/pull_requests", to: "pulls#index"
  get "/orgs", to: "orgs#index"
  get "/repos", to: "repos#index"
  get "/following/recent_activity", to: "commits#following_index"
  get "/recent_activity", to: "commits#index"

end
