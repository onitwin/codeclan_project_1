class Manufacturer

  attr_accessor :id, :name,:active

  def initialize(options)
    @id=options['id'].to_i if options['id']
    @name=options['name']
    @active=true
  end













end
