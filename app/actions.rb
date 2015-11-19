# Homepage (Root path)
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

get '/groups/new' do
  erb :'groups/new'
end

get '/groups/:id' do |id|
  @group = Group.find(id)
  erb :'groups/show'
end

post '/groups' do
  group = Group.new(
    name: params[:name]
  )
  if group.save
    redirect "/results?search_term=#{group.name}"
  else
    redirect '/groups/new'
  end
end

post '/groups/join' do
end

get '/groups/:group_id/activities/new' do
  @activity = Activity.new
  erb :'groups/activities/new'
end

post '/groups/:group_id/activities/create' do
  @activity = Activity.new(
  name: params[:name],
  time: params[:time],
  location: params[:location]
  )
  if @activity.save
    redirect '/groups/#{:group_id}'
  else
    erb :'groups/activities/new'
  end
end

get '/groups/:group_id/activities/:id' do
  @activity = Activity.find params[:id]
  erb :'groups/activities/show'
end

