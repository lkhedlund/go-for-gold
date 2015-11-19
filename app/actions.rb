# Homepage (Root path)
get '/' do
  erb :index
end

get '/results' do
  puts "You've made it"
end

post '/search' do
  puts params
  redirect '/results'
end
