Rails.application.routes.draw do
  root :to => "issues#index"

  resources :issues
  resources :projects
end
