# Homepage (Root path)
get '/' do
  erb :index
end

get '/admin/:id' do |id|
  session[:user_id] = id
  redirect '/'
end
