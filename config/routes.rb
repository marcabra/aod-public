Aod::Application.routes.draw do
  resources :agencies, only: [:index, :show]
  resources :regions, only: [:index, :show]
  resources :topics, only: [:index, :show]
  resources :projects, only: [:show]

  # pages
  get '/home', to: redirect('/')

  root to: 'high_voltage/pages#show', id: 'home'
end
