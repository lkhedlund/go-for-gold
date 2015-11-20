# Homepage (Root path)
helpers do

  def current_user
   begin
     @current_user = User.find(session[:id]) if session[:id]
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

get '/' do
  erb :index
end

post '/users' do
  @user = User.create(
    name: params[:name],
    picture: params[:picture],
    city: params[:city],
    description: params[:description]
    )
  if @user.save
    session[:user_id] = @user.id
    redirect '/users'
  else
    erb :'users/new'
  end
end

get '/users' do
  @users = User.order(name: :desc)
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

get '/users/:id' do
  @user = User.find params[:id]
  @users = User.where(name: @user.name)
  erb :'users/show'
end

post '/users' do
  # binding.pry
  user = User.new(
    picture: params[:picture],
    name: params[:name],
    city: params[:city],
    description: params[:description],
    badge_count: params[:badge_count]
    )
  if user.save!
    redirect "/users"
  else
    redirect '/users/new'
  end
end