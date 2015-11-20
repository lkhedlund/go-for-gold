get '/groups/:group_id' do |id|
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
  else
    halt erb :'/errors/400.erb'
  end
end

post '/groups/join' do
end
