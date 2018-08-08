require 'pry'
require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])
      binding.pry
      params[:pirate][:ships].each do |details|
        Ship.new(details)
        binding.pry
      end
      @ships = Ship.all
      binding.pry
      erb :'pirates/show'
    end

  end
end
