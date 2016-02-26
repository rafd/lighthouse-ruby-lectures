require 'sinatra'
require 'json'

get '/' do
  erb :'index.html'
end

post '/search' do
  query = params[:query]

  songs = [
          {title:'Clocks', artist:'Coldplay'},
          {title:'Hotline Bling', artist:'Drake'},
          {title:'Shine On You Crazy Diamond', artist:'Pink Floyd'},
          {title:'Till Its Gone', artist:'Yelawolf'},
          {title:'Creep', artist:'Radiohead'},
          {title:'Roaches', artist:'Purple Squid'},
          {title:'Live The Way You Lie', artist:'Eminem'},
          {title:'Baby Got Back', artist:'Sir Mixalot'},
          {title:'Bohemian Rhapsody', artist:'Queen'},
          {title:'Highlights', artist:'Kanye West'},
          {title:'The Devil Cried', artist:'Black Sabbath'},
          {title:'Apparently', artist:'Jay Cole'},
          {title:'Baby', artist: 'Justin Bieber'} ]

  filtered_songs = songs.select do |song|
    Regexp.new(query).match(song[:title]) || Regexp.new(query).match(song[:artist])
  end

  content_type :json

  filtered_songs.to_json
end
