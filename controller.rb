require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/stock')
require_relative('./models/manufacturer')
also_reload( './models/*' )

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
  @new_item=Stock.new(params)
  @new_item.save
  redirect(:stock)
end


get '/manufacturers' do
  @manufacturers=Manufacturer.all
  erb(:manufacturers)
end

get '/stock/:id' do
  x = params[:id]
  @stock = Stock.find(x)
  erb(:view_item)
end


get '/stock/:id/update' do
  x = params[:id]
  @stock=Stock.find(x)
  erb(:update)
end

post '/stock/:id/update' do
  stock=Stock.new(params)
  stock.update
  erb(:updated)
end

post '/stock/:id/deleted' do
  stock_id=params[:id]
  @stock=Stock.find(stock_id)
  @stock.delete
  erb(:deleted)
end



# post '/stock/addstock' do
#   @stock=Stock.new(params)
#   @stock.save
# end
# post '/stock/:id/deleted' do
#   x=params[:id]
#   stock=@stock.find(x)
#   stock.delete(x)
#   erb(:deleted)
# end
