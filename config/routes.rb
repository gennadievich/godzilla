Rails.application.routes.draw do
  root :to => "issues#index"

  resources :issues
  resources :projects
  get "/projects/filter/:filter_params", to: "projects#index", as: "filter_projects"
end
