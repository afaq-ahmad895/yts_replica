Rails.application.routes.draw do
  root 'yts#index'
  get 'yts/index'
  get 'yts/movies_list'
  get 'yts/movie_100_top'
  get 'yts/movie_api'
  get 'yts/index1'
  get 'yts/index2'
  get 'yts/search'
  get '/search', to: 'yts#search'
  get 'yts/index3'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # for movie_api new functin k liye
end
