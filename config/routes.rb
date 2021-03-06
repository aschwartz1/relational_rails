Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/manufacturers', to: 'manufacturers#index'
  get '/manufacturers/new', to: 'manufacturers#new'
  get '/manufacturers/:id', to: 'manufacturers#show'
  get '/manufacturers/:id/edit', to: 'manufacturers#edit'
  get '/manufacturers/:id/discs', to: 'manufacturers#discs'
  get '/manufacturers/:manufacturer_id/discs/new', to: 'discs#new'
  post '/manufacturers', to: 'manufacturers#create'
  post '/manufacturers/:manufacturer_id/discs', to: 'discs#create'
  patch '/manufacturers/:id', to: 'manufacturers#update'
  delete '/manufacturers/:id', to: 'manufacturers#destroy'

  get '/discs', to: 'discs#index'
  get '/discs/:id', to: 'discs#show'
  get '/discs/:id/edit', to: 'discs#edit'
  patch '/discs/:id', to: 'discs#update'
  delete '/discs/:id', to: 'discs#destroy'
end
