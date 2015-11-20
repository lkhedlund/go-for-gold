# Homepage (Root path)
get '/' do
  erb :index
end

# Homepage (Root path)
# get '/groups' do
#   erb :'groups/index'
# end

get '/groups/:id' do
  # session['song_review'] = nil
  # if session['username']
    @group = Group.find(params[:id])
    erb :'groups/show'    #before index
  # else
    # redirect '/'
  # end
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
