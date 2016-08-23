require 'sinatra'
require 'json'

CITIES = ["Berlin","Toronto", "Montreal","Halifax","Vancouver","Tokyo","Shanghai","Moscow","Paris","Brussels","Barcelona"]

get "/" do
  erb :index
end

get "/cities" do
  content_type :json
  if params["query"].length == 0
    return [].to_json
  else
    CITIES.select { |city|
      city.downcase =~ Regexp.new("^"+params["query"].downcase)
    }.to_json
  end
end

