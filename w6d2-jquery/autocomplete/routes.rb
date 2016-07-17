require 'sinatra'
require 'json'

CITIES = ["Berlin","Toronto", "Montreal","Halifax","Vancouver","Tokyo","Shanghai","Moscow","Paris","Brussels","Barcelona"]

get "/" do
  erb :index
end

get "/cities" do
  content_type :json
  CITIES.to_json
end

