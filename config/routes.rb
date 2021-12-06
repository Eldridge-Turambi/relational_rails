Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/venues', to: 'venues#index'
  get '/venues/:id', to: 'venues#show'

  get '/performers', to: 'performers#index'
  get '/performers/:id', to: 'performers#show'

  get '/venues/:id/performers', to: 'venue_performers#index'
  # get '/performers', to: 'performers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/bars', to: 'bars#create'
  get '/bars', to: 'bars#index'
  get '/bars/:id', to: 'bars#show'

  get '/drinks', to: 'drinks#index'
  get '/drinks/:id', to: 'drinks#show'

  get '/bars/:id/drinks', to: 'bar_drinks#index'

end
