class Stock

  attr_accessor :id, :name,:manufacturer_id,:type,
  :quantity,:unit_cost,:sell_price,:description,:url

  def initialize(options)
    @id=options['id'].to_i if options['id']
    @name=options['name']
    @manufacturer_id=options['manufacturer_id'].to_i
    @type=options['type']
    @quantity=options['quantity'].to_i
    @unit_cost=options['unit_cost'].to_f
    @sell_price=options['sell_cost'].to_f
    @description='DESCRIPTION TO GO HERE-PLEASE UPDATE'
    @url='URL TO GO HERE- SOURCE AND UPDATE'

  end













end
