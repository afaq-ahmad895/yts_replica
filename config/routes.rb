Rails.application.routes.draw do
  # root 'yts#index'
  # get 'yts/index'
  # get 'yts/new'
  # resources :yts

  get 'films/new'
  get 'films/index'
  root 'films#index'
  resources :films
  #post '/add_movie', to: 'films#add_movie', as: 'add_movie'

  post 'add_movie', to: 'films#add_movie'

end