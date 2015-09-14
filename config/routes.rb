Rails.application.routes.draw do
  get 'agents/index'

  root 'sessions#index'

  post '/new' => 'sessions#create', as: :create_user
  post '/login' => 'sessions#new', as: :new_session

  get '/dashboard' => 'agents#index', as: :agent
end
