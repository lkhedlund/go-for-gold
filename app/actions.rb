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
