require_relative('../db/sql_runner')

class Manufacturer

  attr_accessor :id, :name,:active

  def initialize(options)
    @id=options['id'].to_i if options['id']
    @name=options['name']
    @active=true
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

  def me #success- returns single object matching id that was called
    sql='SELECT * FROM manufacturers WHERE id=$1'
    values=[@id]
    result=SqlRunner.run(sql,values)
    return result
  end

  def all_of_me #success- returns ONLY results from table matching a single manufacturer
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

  def delete
    sql='DELETE FROM manufacturers WHERE id=$1'
    values=[@id]
    SqlRunner.run(sql,values)
  end

  #UPDATE METHOD















end
