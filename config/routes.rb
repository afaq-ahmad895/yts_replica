Rails.application.routes.draw do

  # root 'yts#index'
  # get 'yts/index'

  #  get 'yts/new'
  # resources :yts

  get 'films/new'
  get 'films/index'
  root 'films#index'
  resources :films

end
