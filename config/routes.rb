Rails.application.routes.draw do
  root :to => "projects#index"

  resources :projects do
    resources :issues
  end


  get "/projects/:project_type/:project_category", to: "projects#index", as: "filter_project"
end
