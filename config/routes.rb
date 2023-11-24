Rails.application.routes.draw do
  root 'yts#index'
  get 'yts/index'
 # get 'yts/movies_list'
 # get 'yts/movie_100_top'
 # get 'yts/movie_api'
  get 'yts/index1'
  get 'yts/index2'
  #get 'yts/search'
  #get 'yts/search1'
  get '/search', to: 'yts#search'
 # get '/search1', to: 'yts#search1'
  get 'yts/index3'

  get 'yts/movie_detail'
  get '/movie_detail', to: 'yts#movie_detail'

 #post '/movie_detail', to: 'yts#movie_detail'
end
