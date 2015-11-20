get '/groups/:group_id/activities/new' do
  @group_id = params[:group_id]
  @activity = Activity.new
  erb :'groups/activities/new'
end

post '/groups/:group_id' do
  @group_id = params[:group_id]
  @activity = Activity.new(
  name: params[:name],
  time: params[:time],
  location: params[:location],
  completed: false,
  group_id: params[:group_id]
  )
  if @activity.save
    redirect "/groups/#{@group_id}"
  else
    erb :'groups/activities/new'
  end
end

get '/groups/:group_id/activities/:id' do
  @group_id = params[:group_id]
  @activity = Activity.find params[:id]
  erb :'groups/activities/show'
end
