require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/stock')
require_relative('./models/manufacturer')
also_reload( './models/*' )

get "/" do #homepage
  erb(:index)
end

get '/stock' do #displays all stock
  @stock=Stock.all
  @manufacturer=Manufacturer.all
  erb(:stock)
end

get '/stock/addstock' do #links to 'add stock' page
  @manufacturer=Manufacturer.all
  erb(:addstock)
end

post '/stock/addstock' do #SHOULD add stock item but doesnt
  @new_item=Stock.new(params)
  @new_item.save
  # erb(:index)
  redirect to '/stock'
end


get '/manufacturers' do #fetches and displays all manufacturers
  @manufacturers=Manufacturer.all
  erb(:manufacturers)
end

get '/stock/:id' do #shows an individual item of stock
  x = params[:id]
  @stock = Stock.find(x)
  erb(:view_item)
end


get '/stock/:id/update' do #links to update page and sends it the individual item of stock to be updated
  x = params[:id]
  @stock=Stock.find(x)
  @manufacturer=Manufacturer.all
  erb(:update)
end

post '/stock/:id/update' do #update page- creates new item and overwrites existing item with matching ID
  stock=Stock.new(params)
  stock.update
  erb(:updated)
end

post '/stock/:id/deleted' do #deletes item and takes user to page to indicates success
  stock_id=params[:id]
  @stock=Stock.find(stock_id)
  @stock.delete
  erb(:deleted)
end

post 'manufacturers/:id/delete' do
  manufacturer_id=params[:id]
  manu=Manufacturer.find(manufacturer_id)
  manu.delete
  redirect to '/manufacturers'
end

get '/manufacturer/:id/update' do
  x=params[:id]
  @manufacturer=Manufacturer.find(x)
  @manufacturers=Manufacturer.all
  erb(:manufacturerupdate)
end

post '/manufacturer/:id/update' do
  manu=Manufacturer.new(params)
  manu.update
  erb(:manufacturers)
end

get '/addmanufacturer' do
  erb(:addmanufacturer)
end

post'/addmanufacturer' do
  new_manufacturer=Manufacturer.new(params)
  new_manufacturer.save
  erb (:manufacturers)
end
