class MakersBnB < Sinatra::Base

  get '/spaces/new' do
    erb :'spaces/new'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'/spaces/index'
  end

  post '/spaces' do
    @spaces = Space.create(name: params[:name],
                           description: params[:description],
                           price: params[:price],
                           available_from: params[:available_from],
                           available_to: params[:available_to])
    redirect '/spaces'
  end


end