require 'sinatra'
require 'sinatra/activerecord'
require '.model/artists'

get '/' do
  redirect '/artists'
end

get '/artists' do
  @artists = Artist.all
  erb :index
end

get '/artists/new' do

  erb :new
end 

get '/artists/:id' do 
  @artist = Artist.find(params[:id])
  erb :show
end

get '/artists/:id/edit' do
  @artists = Artist.find(params[:id])
  erb :edit 
end 

post '/artists' do 
  Artist.create params #unique 
  redirect '/artists'
end 

put '/artists/:id' do 

  artist = Artist.find(params[:id])
  artist.name = params[:artist_name]
  artist.save
  redirect '/artists'
end 

delete '/artists/:id' do 
  artist = Artist.find(params[:id])
  artist.destroy
  redirect '/artists'
end 

