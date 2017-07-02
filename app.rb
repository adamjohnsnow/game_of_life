require 'sinatra'
require './lib/game'
require './lib/neighbourhood'

class GameOfLife < Sinatra::Base
  use Rack::MethodOverride
  use Rack::Session::Pool

  get '/' do
    session[:game] = Game.new()
    redirect '/loop'
  end

  get '/loop' do
    @game = session[:game]
    @game.tick(1)
    erb(:index)
  end

  get '/pause' do
    @game = session[:game]
    erb(:pause)
  end
end
