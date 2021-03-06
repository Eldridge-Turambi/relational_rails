Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/venues', to: 'venues#index'
  get '/venues/new', to: 'venues#new'
  get '/venues/:id', to: 'venues#show'
  post '/venues', to: 'venues#create'
  get '/venues/:id/edit', to: 'venues#edit'
  patch '/venues/:id', to: 'venues#update'
  delete '/venues/:id', to: 'venues#destroy'
  #delete '/venues', to: 'venues#destroy'

  get '/performers', to: 'performers#index'
  get '/performers/:id', to: 'performers#show'

  get '/venues/:id/performers', to: 'venue_performers#index'
  get '/venues/:id/performers/new', to: 'venue_performers#new'
  post '/venues/:id/performers', to: 'venue_performers#create'

  get '/performers/:id/edit', to: 'performers#edit'
  patch '/performers/:id', to: 'performers#update'
  delete '/performers/:id', to: 'performers#destroy'

  get '/bars', to: 'bars#index'
  get '/bars/new', to: 'bars#new'
  get '/bars/:id', to: 'bars#show'
  post '/bars', to: 'bars#create'
  get '/bars/:id/edit', to: 'bars#edit'
  patch '/bars/:id', to: 'bars#update'
  delete '/bars/:id', to: 'bars#destroy'

  get '/bars/:id/drinks', to: 'bar_drinks#index'
  get '/bars/:id/drinks/new', to: 'bar_drinks#new'
  post '/bars/:id/drinks', to: 'bar_drinks#create'

  get '/drinks', to: 'drinks#index'
  get '/drinks/:id', to: 'drinks#show'
  get '/drinks/:id/edit', to: 'drinks#edit'
  patch '/drinks/:id', to: 'drinks#update'
  delete '/drinks/:id', to: 'drinks#destroy'
end
