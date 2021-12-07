Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/venues', to: 'venues#index'
  get '/venues/:id', to: 'venues#show'

  get '/performers', to: 'performers#index'
  get '/performers/:id', to: 'performers#show'

  get '/venues/:id/performers', to: 'venue_performers#index'
  # get '/performers', to: 'performers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/bars', to: 'bars#index'
  get '/bars/new', to: 'bars#new'
  get '/bars/:id', to: 'bars#show'
  post '/bars', to: 'bars#create'
  get '/bars/:id/edit', to: 'bars#edit'
  patch '/bars/:id', to: 'bars#update'

  get '/bars/:id/drinks', to: 'bar_drinks#index'
  get '/bars/:id/drinks/new', to: 'bar_drinks#new'
  post '/bars/:id/drinks', to: 'bar_drinks#create'

  get '/drinks', to: 'drinks#index'
  get '/drinks/:id', to: 'drinks#show'
  get '/drinks/:id/edit', to: 'drinks#edit'
  patch '/drinks/:id', to: 'drinks#update'

end
