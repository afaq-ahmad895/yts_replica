Rails.application.routes.draw do
  # root 'yts#index'
  # get 'yts/index'
  # get 'yts/new'
  get 'films/new'
  get 'films/index'
  root 'films#index'
  resources :films

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end