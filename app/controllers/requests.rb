class MakersBnB < Sinatra::Base

  get '/request/:id' do
    @booking = Request.first(id: params[:id])
    @space = Space.first(id: @booking.space_id)
    @user = User.first(id: @booking.user_id)
    erb :'/requests/request_booking'
  end

  post '/requests' do
    space = Space.first(id: params[:id])
    taken_dates = unavailable_dates(space)
    request = Request.create(space_id: params[:id],
                                user_id: current_user.id,
                                status: 'pending',
                                date: params[:book_a_night])
    if taken_dates.include?(request.date)
      request.destroy
      flash.keep[:errors] = ["Date is already taken!"]
      redirect "/spaces/#{space.id}"
    else
      current_user.requests << request
      space.requests << request
      redirect "/request/#{request.id}"
    end
  end

  post '/requests/outcome' do
    request = Request.first(id: params[:id])
    request.update(:status => params[:status])
    p params[:status]
    redirect "/requests/user"
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
