require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'require_all'
require_all './lib'
also_reload('lib/**/*.rb')

get '/' do
  @playlists = Playlist.all
  erb(:index) 
end

post '/add_playlist' do
  @playlists = Playlist.all
  new_playlist = Playlist.new(name: params.fetch('playlist_name'))
  new_playlist.save
  erb(:index)
end

get '/playlist/:id' do
  @playlist = Playlist.get_playlist(params.fetch('id').to_i)
  erb(:new_song)
end

post '/playlist/:id' do
  @playlist = Playlist.get_playlist(params.fetch('id').to_i)
  new_song = Song.new(title: params.fetch('song_title'), artist: params.fetch('song_artist'))
  @playlist.add_song(new_song)
  erb(:new_song)
end

get '/playlists' do
  @playlists = Playlist.all
  erb(:all_playlists)
end

get '/clear' do
  Playlist.clear
  @playlists = Playlist.all
  erb(:index)
end