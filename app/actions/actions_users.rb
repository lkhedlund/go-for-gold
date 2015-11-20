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