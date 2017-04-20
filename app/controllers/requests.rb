class MakersBnB < Sinatra::Base

  get '/request/:id' do
    request = Request.first(id: params[:id])
    @status = request.status
    @id = request.id
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
    redirect "/request/#{request.id}"
  end

  post '/requests/outcome' do
    request = Request.first(id: params[:id])
    request.update(:status => params[:status])
    p params[:status]
    redirect "/request/#{request.id}"
  end

  get '/requests/user' do
    @user = current_user
    @requests_sent = current_user.requests
    @requests_received = []
    current_user.spaces.each do |space|
      space.requests.each do |request|
        @requests_received << request
      end
    end
    erb :'requests/user_requests'
  end

end
