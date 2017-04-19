class MakersBnB < Sinatra::Base

  get '/requests/:id' do
    @space = Space.first(id: params[:id])
    erb :'/requests/request_booking'
  end
end
