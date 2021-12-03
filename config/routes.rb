Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/venues', to: 'venues#index'

  get '/bars', to: 'bars#index'
  get '/bars/:id', to: 'bars#show'

  get '/drinks', to: 'drinks#index'
  get '/drinks/:id', to: 'drinks#show'

  get '/bars/:id/drinks', to: 'bar_drinks#index'

end
