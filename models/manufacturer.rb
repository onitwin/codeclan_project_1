  require_relative('../db/sql_runner')

class Manufacturer

  attr_accessor :id, :name,:active

  def initialize(options)
    @id=options['id'].to_i if options['id']
    @name=options['name']
    @active=options['active']
  end



  #CREATE METHOD
  def save #save method works
    sql="INSERT INTO manufacturers (name,active) VALUES ($1,$2) RETURNING id"
    values=[@name,@active]
    results=SqlRunner.run(sql,values)
    @id=results.first['id'].to_i
  end


  #READ METHODS (single and all)

  def self.all #successful- returns list of all manufacturers
    sql='SELECT * FROM manufacturers'
    results=SqlRunner.run(sql)
    return results.map{|manufacturer|Manufacturer.new(manufacturer)}
  end

  def self.find(id)#success- returns single object matching id that was called
    sql='SELECT * FROM manufacturers WHERE id=$1'
    values=[id]
    result=SqlRunner.run(sql,values)[0]
    return Manufacturer.new(result)
  end

  def find_by_name #success- returns ONLY results from table matching a single manufacturer
    sql='SELECT * FROM manufacturers WHERE name=$1'
    values=[@name]
    result=SqlRunner.run(sql,values)
    return result
  end

  #DELETE methods (single and all)

  def self.delete_all #success- deletes all results from manufacturer table
    sql='DELETE FROM manufacturers'
    SqlRunner.run(sql)
  end

  def delete()#successful- deletes self method
    sql='DELETE FROM manufacturers WHERE id=$1'
    values=[@id]
    SqlRunner.run(sql,values)
  end

  def delete_by_brand()#succes- removes all manufacturers of chosen name
    sql='DELETE  FROM manufacturers WHERE name=$1'
    values=[@name]
    SqlRunner.run(sql,values)
  end

  #UPDATE METHOD GOES HERE
  def update() #succesful- updates SQL database
    sql='UPDATE manufacturers SET (name,active)=($1,$2)
    WHERE id=$3'
    values=[@name,@active,@id]
    SqlRunner.run(sql,values)
  end

#ALL BASIC CRUD METHODS COMPLETE



end
