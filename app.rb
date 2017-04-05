require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      status 200
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])

      params[:pirate][:ships].each do |ship_info|
        Ship.new(ship_info)
      end
      @ships = Ship.all
      erb :'pirates/show'
    end
    # code other routes/actions here

  end
end
