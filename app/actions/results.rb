# Search results method
get '/results' do
  @groups = Group.all
  unless params[:search_term].blank?
    term = "%#{params[:search_term]}%"
    @groups = @groups.where('name LIKE :term', { term: term })
  end
  erb :results
end
