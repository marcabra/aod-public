Aod::Application.routes.draw do
  get "projects/show"

  resources :agencies, only: [:index, :show]
  resources :regions, only: [:index, :show]
  resources :topics, only: [:index, :show]
  resources :projects, only: [:show]

  root :to => 'agencies#index'
end
