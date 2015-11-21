# Homepage (Root path)
helpers do
	def handle_errors
		@errors = session[:error] if session[:error]
		session[:error] = nil
	end

	def current_user
		@current_user = User.find(1)
    #@current_user = User.find(session[:user_id]) if session[:user_id]
	end

	def current_group
		session[:group] = nil
	end

end

before do
	current_user
	handle_errors
	current_group
end
