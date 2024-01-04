Rails.application.routes.draw do
<<<<<<< Updated upstream
  root 'yts#index'
  get 'yts/index'
=======
  # root 'yts#index'
  # get 'yts/index'
   get 'yts/new'
  resources :yts

  get 'films/new'
  get 'films/index'
  root 'films#index'
  resources :films
>>>>>>> Stashed changes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
