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

get '/' do
  erb :index
end

get '/results' do
  @groups = Group.all
  unless params[:search_term].blank?
    term = "%#{params[:search_term]}%"
    @groups = @groups.where('name LIKE :term', { term: term })
  end
  erb :results
end

get '/groups/:id' do |id|
  @group = Group.find(id)
	session[:group_users] = @group.users.all
  erb :'groups/show'
end

post '/groups' do
  group = Group.new(
    name: params[:name]
  )
  if group.save
    redirect "/results?search_term=#{group.name}"
  end
end

post '/groups/join' do
end