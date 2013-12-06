Aod::Application.routes.draw do
  resources :agencies, only: [:index, :show]
  resources :regions, only: [:index, :show]
  resources :topics, only: [:index, :show]
  resources :projects, only: [:show]

  root :to => 'regions#index'
end
