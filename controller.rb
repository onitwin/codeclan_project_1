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

get '/stock/addstock' do
  erb(:addstock)
end

post '/stock/addstock' do
  @stock=Stock.new(params)
  @stock.save
end

get '/manufacturers' do
  @manufacturers=Manufacturer.all
  erb(:manufacturers)
end

get '/stock/:id' do
  x = params[:id]
  @stock=Stock.find(x)
  erb(:view_item)
end

get '/stock/:id/update' do
  x = params[:id]
  @stock=Stock.find(x)
  erb(:update)
end

post '/stock/:id/update' do
  x=params[:id]
  @stock=Stock.new(x)
  @stock.id=params[:id]
  @stock.update
  erb(:updated)
end

post '/stock/:id/deleted' do
  x=params[:id]
  @stock=Stock.new(x)
  @stock.delete
  erb(:deleted)
end
