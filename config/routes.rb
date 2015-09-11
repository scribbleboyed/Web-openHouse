Rails.application.routes.draw do
  root 'sessions#index'

  post '/new' => 'sessions#new', as: :new_session
  post '/login' => 'sessions#create', as: :create_session
end
