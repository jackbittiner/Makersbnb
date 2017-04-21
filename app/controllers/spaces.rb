class MakersBnB < Sinatra::Base

  get '/spaces/new' do
    erb :'spaces/new'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'/spaces/index'
  end

  post '/spaces' do
    space = Space.create(name: params[:name],
                         description: params[:description],
                         price: params[:price],
                         available_from: params[:available_from],
                         available_to: params[:available_to],
                         user_id: current_user.id,
                         image_url: params[:image_url])
    current_user.spaces << space
    redirect '/spaces'
  end


  get '/spaces/user/:username' do
    user = User.first(username: params[:username])
    @spaces = user.spaces
    erb :'spaces/index'
  end

  get '/spaces/update' do
    @space = Space.first(id: params[:id])
    erb :'/spaces/update'
  end

  post '/spaces/update' do
    space = Space.first(id: params[:id])
    # require 'pry'; binding.pry;
    space.update(name: params[:name],
                description: params[:description],
                price: params[:price],
                available_from: params[:available_from],
                available_to: params[:available_to],
                user_id: current_user.id,
                image_url: params[:image_url])
    redirect "/spaces/user/#{current_user.username}"
  end

  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    @unavailable_dates = @space.unavailable_dates
    erb :'/spaces/a_space'
  end

end
