
post '/users/new' do
  @user = User.new(
  name: params[:name],
  city: params[:city],
  picture: params[:picture],
  description: params[:description]
  )
  if @user.save
    redirect "/users/#{@user.id}"
  else
    erb :'users/new'
  end
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

get '/users/:id' do
  @user = User.find params[:id]
  @users = User.where(name: @user.name)
  erb :'users/show'
end


get '/users/:id/edit' do |id|
  @user_id = id
  @user = User.find(@user_id)
  erb :'/users/edit'
end

# post '/users' do
#   # binding.pry
#   user = User.new(
#     picture: params[:picture],
#     name: params[:name],
#     city: params[:city],
#     description: params[:description],
#     badge_count: params[:badge_count]
#     )
#   if user.save!
#     redirect "/users/#{user_id}"
#   else
#     redirect '/users/new'
#   end
# end


# get '/users' do
#   @users = User.order(name: :desc)
#   erb :'users/index'
# end