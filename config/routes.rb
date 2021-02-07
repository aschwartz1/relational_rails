Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/shops', to: 'shops#index'
  get '/shops/new', to: 'shops#new'
  get '/shops/:id', to: 'shops#show'
  get '/shops/:id/edit', to: 'shops#edit'
  post '/shops', to: 'shops#create'
  patch '/shops/:id', to: 'shops#update'
  delete '/shops/:id', to: 'shops#destroy'

  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/new', to: 'manufacturers#new'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/manufacturers/:id/edit', to: 'manufacturers#edit'
  get '/manufacturers/:id/discs', to: 'manufacturers#discs'
  post '/manufacturers', to: 'manufacturers#create'
  patch '/manufacturers/:id', to: 'manufacturers#update'
  delete '/manufacturers/:id', to: 'manufacturers#destroy'

  get '/discs', to: 'discs#index'
  get '/discs/:id', to: 'discs#show'
  get '/discs/:id/edit', to: 'discs#edit'
  patch '/discs/:id', to: 'discs#update'
end
