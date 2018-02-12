# cd /blah/blah
# ruby -I lib app.rb
#
# http://localhost:4567/movies

require 'sinatra'
require 'movie'
require 'movie_store'

store = MovieStore.new('movies.yml')

get('/movies') do
  @movies = store.all
  erb :index
end

get('/movies/new') do
  erb :new
end

post('/movies/create') do
  @movie = Movie.new
  @movie.title = params['title']
  @movie.director = params['director']
  @movie.year = params['year']
  # "Recieved: #{params.inspect}"
  store.save(@movie)
  redirect '/movies/new'
end

# !!! Must be the last route in the file
get('/movies/:id') do
  id = params['id'].to_i
  @movie = store.find(id)
  erb :show
end
