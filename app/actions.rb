# Homepage (Root path)
get '/' do
  erb :index
end

get '/results' do
  @groups = Group.where(name: params[:group_name])
  puts @groups.inspect
  erb :results
end
