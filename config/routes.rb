Rails.application.routes.draw do
  root :to => "issues#index"

  resources :issues
  resources :projects

  get "/projects/:project_type/:project_category", to: "projects#index", as: "filter_project"
end
