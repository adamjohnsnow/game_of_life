require 'sinatra'
require './lib/game'
require './lib/neighbourhood'

class GameOfLife < Sinatra::Base

  use Rack::MethodOverride
  use Rack::Session::Pool

  get '/' do
    @game = session[:game]
    erb(:index)
  end

end
