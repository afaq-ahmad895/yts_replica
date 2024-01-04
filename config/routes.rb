Rails.application.routes.draw do
  # root 'yts#index'
  # get 'yts/index'
  resources :apis
  root 'apis#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
