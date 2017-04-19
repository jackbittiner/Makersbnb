class MakersBnB < Sinatra::Base


  get '/' do
    @user = User.new
    erb :'users/index'
  end

  post '/users' do
    @user = User.create(email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation],
    firstname: params[:firstname],
    lastname: params[:lastname],
    username: params[:username])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/spaces')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/index'
    end
  end

end
