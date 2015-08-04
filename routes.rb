require 'sinatra'
require 'json'

TASKS = {"123" => {id: "123",
                   description: "asdasd"}}

get "/" do
  erb :index
end

get "/task" do
  content_type :json
  TASKS.values.to_json
end

post "/task" do
  TASKS[params["id"]] = {id: params["id"],
                        description: params["description"]}
  true
end

delete "/task/:id" do
  TASKS.delete(params[:id])
  true
end
