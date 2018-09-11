Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :votes
  root 'votes#new'
  get '/new', to: 'votes#new'
  get '/vote', to: 'votes#vote'
end
