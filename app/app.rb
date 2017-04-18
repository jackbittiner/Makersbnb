ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

require_relative 'server'
require_relative 'controllers/spaces'
require_relative 'models/space'

class MakersBnB < Sinatra::Base


  run! if app_file == $0

end
