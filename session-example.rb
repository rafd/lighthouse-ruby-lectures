# http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html

post "/session" do
   if @user = User.where(email: params[:email]).authenticate(params[:password])
     session[:user_id] = @user.id
   else
     # some error
   end
end

get "/myproducts" do
   if session[:user_id]
     User.find(session[:user_id]).products
   end
end

delete "/session" do
  session.delete(:user_id)
end


