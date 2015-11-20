get '/groups/:group_id' do |id|
  session[:group_users] = @group.users.all
  @group = Group.find(id)
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
