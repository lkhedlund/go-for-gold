# Homepage (Root path)
helpers do
  def current_user
   begin
     @current_user = User.find(session[:user_id]) if session[:user_id]
   rescue ActiveRecord::RecordNotFound
     session[:id] = nil
   end
  end

 end

get '/' do
  erb :index
end

get '/results' do
  @groups = Group.where(name: params[:group_name])
  puts @groups.inspect
  erb :results
end

post '/groups/new' do
  Group.create(
    name: params[:group_name]
  )
  puts "Successfully created!"
end

post '/groups/join' do
  #more to come!
end

