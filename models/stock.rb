require_relative('../db/sql_runner')

class Stock

  attr_accessor :id, :name,:manufacturer_id,:type,
  :quantity,:unit_cost,:sell_price,:description,:url

  def initialize(options)
    @id=options['id'].to_i if options['id']
    @name=options['name']
    @manufacturer_id=options['manufacturer_id'].to_i
    @type=options['type']
    @bsl=options['bsl'].to_i #basic stock level abbreviation
    @quantity=options['quantity'].to_i
    @unit_cost=options['unit_cost'].to_f
    @sell_price=options['sell_price'].to_f
    @description='DESCRIPTION TO GO HERE-PLEASE UPDATE' #add after objext creation
    @url='URL TO GO HERE- SOURCE AND UPDATE'# add IMAGE url here

  end

  def save
    sql="INSERT INTO stock_items (name,manufacturer_id,type,bsl,quantity,
    unit_cost,sell_price,description,url) VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9) RETURNING id"
    values=[@name,@manufacturer_id,@type,@bsl,@quantity,@unit_cost,@sell_price,
      @description,@url]
    results=SqlRunner.run(sql,values)
    @id=results.first['id'].to_i
  end













end
