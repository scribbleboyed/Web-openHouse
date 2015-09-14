Rails.application.routes.draw do
  get 'agents/index'

  root 'sessions#index'

  post '/new' => 'sessions#create', as: :create_user
  post '/login' => 'sessions#new', as: :new_session

  get '/dashboard' => 'agents#index', as: :agent
  post '/create_listing' => 'listings#create', as: :create_listing
  post '/create_prospect' => 'prospects#create', as: :create_prospect
end
