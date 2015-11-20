# Homepage (Root path)
helpers do
	def handle_errors
		@errors = session[:error] if session[:error]
		session[:error] = nil
	end

	def current_user
		@current_user = User.find(2)
    #@current_user = User.find(session[:user_id]) if session[:user_id]
	end

	def group_users
		session[:group_users] = []
	end

end

before do
	current_user
	handle_errors
	group_users
end