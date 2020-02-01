require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/stock')
require_relative('./models/manufacturer')
also_reload( '/models/*' )

get "/" do
  @stock=Stock.all
  erb(:index)
end

get '/stock' do
  @stock=Stock.all
  erb(:stock)
end

get '/manufacturers' do
  erb(:manufacturers)
end
