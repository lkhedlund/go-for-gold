get '/groups/:id' do
  # session['song_review'] = nil
  # if session['username']
    @group = Group.find(params[:id])
    erb :'groups/show'    #before index
  # else
    # redirect '/'
  # end
end