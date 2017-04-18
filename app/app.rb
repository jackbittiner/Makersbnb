ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

require_relative 'server'

class MakersBnB < Sinatra::Base

  get '/' do
    erb :'users/index'
  end

  post '/users' do
    user = User.create(email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation],
    name: params[:name])
    session[:user_id] = user.id
    redirect to('/spaces/index')
  end

  get '/spaces/index' do
    erb :'spaces/index'
  end


  run! if app_file == $0

  helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end

end
