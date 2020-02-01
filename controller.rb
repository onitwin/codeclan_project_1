require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/stock')
require_relative('./models/manufacturer')
also_reload( '/models/*' )

get "/" do
  erb(:index)
end

get '/stock' do
  @stock=Stock.all
  erb(:stock)
end

get '/manufacturers' do
  @manufacturers=Manufacturer.all
  erb(:manufacturers)
end
