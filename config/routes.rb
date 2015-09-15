Rails.application.routes.draw do
  get 'agents/index'

  root 'sessions#index'

  post '/new' => 'sessions#create', as: :create_user
  post '/login' => 'sessions#new', as: :new_session

  get '/dashboard' => 'agents#index', as: :agent

  get '/event/:id' => 'events#show', as: :event
  post '/create_event' => 'events#create', as: :create_event
  post '/event/:id/edit' => 'events#update', as: :edit_event
  delete '/event/:id/delete' => 'events#destroy', as: :destroy_event

  get '/listing/:id' => 'listings#show', as: :listing
  
  post '/create_listing' => 'listings#create', as: :create_listing
  post '/create_prospect' => 'prospects#create', as: :create_prospect
end
