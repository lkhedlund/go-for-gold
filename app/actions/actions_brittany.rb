put '/groups/:group_id/activities/:id' do |group_id, id|
  @activity = Activity.find(id)
  @activity.update_attributes(
  name: params[:name],
  time: params[:time],
  date: params[:date],
  location: params[:location],
  completed: false,
  group_id: group_id
  )
  if @activity.save
    redirect "/groups/#{group_id}/activities/#{id}"
  else
    erb :'/groups/activities/edit'
  end
end  

get '/groups/:group_id/activities/new' do
  @group_id = params[:group_id]
  @activity = Activity.new
  erb :'/groups/activities/new'
end

post '/groups/:group_id' do
  @group_id = params[:group_id]
  @activity = Activity.new(
  name: params[:name],
  date: params[:date],
  time: params[:time],
  location: params[:location],
  completed: false,
  group_id: params[:group_id]
  )
  if @activity.save
    redirect "/groups/#{@group_id}"
  else
    erb :'/groups/activities/new'
  end
end

get '/groups/:group_id/activities/:id' do
  @group_id = params[:group_id]
  @activity = Activity.find params[:id]
  @location = params[:location]
  erb :'/groups/activities/show'
end

get '/groups/:group_id/activities/:id/edit' do
  @group_id = params[:group_id]
  @activity = Activity.find params[:id]
  erb :'/groups/activities/edit'
end

delete '/groups/:group_id/activities/:id' do |group_id, id|
  @activity = Activity.find(id)
  @activity.destroy
  redirect "/groups/#{group_id}"
end

