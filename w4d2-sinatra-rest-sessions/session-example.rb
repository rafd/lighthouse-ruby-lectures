require "sinatra"
require "active_record"

class User < ActiveRecord::Base
  # http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
  has_secure_password

  has_many :posts
end

class Post < ActiveRecord::Base
  belongs_to :user
end

helpers do
  def current_user
    if session[:id] and user = User.find(session[:id])
      user
    end
  end
end

get "/" do
  @user = current_user
  erb :index
end

post "/register" do
  @user = User.find_by_email(params[:email])
  if @user
    @error = "Email already exists"
    erb :index
  else
    @user = User.create(email: params[:email], password: params[:password])
    redirect "/"
  end
end

post "/login" do
  @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
  if @user
    session[:id] = @user.id
    redirect "/"
  else
    @error = "Wrong email/password"
    erb :index
  end
end

post "/logout" do
  session.clear
  redirect "/"
end








