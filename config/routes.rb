Rails.application.routes.draw do
  get 'films/new'
  get 'films/index'
  root 'films#index'
  resources :films
  post 'add_movie', to: 'films#add_movie'
  get 'generate_excel', to: 'films#generate_excel'
end



