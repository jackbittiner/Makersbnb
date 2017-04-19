class MakersBnB < Sinatra::Base

  get '/requests/:id' do
    request = Request.first(params[:id])
    @status = request.status
    @space = Space.first(id: request.space_id)
    erb :'/requests/request_booking'
  end

  post '/requests' do
    space = Space.first(id: params[:id])
    request = Request.create(space_id: params[:id],
                              user_id: current_user.id,
                              status: 'pending',
                              date: '19/04/17')
    current_user.requests << request
    space.requests << request
    redirect "/requests/#{request.id}"
  end

end