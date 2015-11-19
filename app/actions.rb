# Homepage (Root path)
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
