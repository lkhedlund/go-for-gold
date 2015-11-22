get '/groups/:group_id' do |id|
  @group = Group.find(id)
  session[:group] = @group
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

post '/groups/join/:group_id' do |id|
  group = Group.find(id)
  group.users << @current_user
  redirect "/groups/#{id}"
end

delete '/groups/leave/:group_id' do |id|
  group = Group.find(id)
  group.users.delete(@current_user)
  redirect "/"
end

# quick fix for rsvp attended/unattended
post '/groups/:group_id/activities/:activity_id/rsvp' do
  activity = Activity.find(params[:activity_id])
  activity.users.all
  badges = @current_user.badge_count.to_i
  if activity.users.include? @current_user
    activity.users.delete(@current_user)
    @current_user.update_attributes(
      badge_count: badges -= 1
      )
  else
    activity.users << @current_user
    @current_user.update_attributes(
      badge_count: badges += 1
      )
  end
  @current_user.save
  redirect "/groups/#{params[:group_id]}"
end
