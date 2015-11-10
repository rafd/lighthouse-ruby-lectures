class User
  # http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
  has_secure_password

  has_many :posts
end

class Post
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
   if @user = current_user
     @posts = @user.posts
     erb :posts
   else
     erb :login
   end
end

post "/login" do
   if @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
     session[:id] = @user.id
     redirect "/"
   else
     @error = "Wrong email/password"
     redirect "/login"
   end
end

post "/logout" do
  session.delete(:id)
  # or session.clear
end


