require ('sinatra')
require ('sinatra/reloader') if development?

enable(:sessions)



users = {
		"Xavier" => ["Xavier", "first", "pizza", "Mac"],
		"Sebastian" => ["Sebastian", "second", "Cheesburger", "iphone"],
		"Xander" => ["Xander", "third", "Chicken nuggets", "ipod"]
	}
	

get "/login" do 
	erb(:login)
end

post "/login" do

	@username = params[:username]
	@password = params[:password]
	@users = users

	if @username == @users[@username][0] && @password == @users[@username][1]
		session[:username] = @username
		redirect to("/profile")
	else
		erb(:login)
	end	
end

get "/profile" do
	@username = session[:username]

	if @username != nil
		@food = users[@username][2]
		@device = users[@username][3]
		erb(:profile)
	else
		redirect to("/login")	

	end
end

get "/logout" do
	session.clear
	redirect to("/login")
	end


