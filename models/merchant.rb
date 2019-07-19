class Merchant

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = 'INSERT INTO merchants(name) VALUES ($1) RETURNING id'
    values = [@name]
    @id= SqlRunner.run(sql, values)[0]['id']
  end


  def merchant
    sql = 'SELECT * FROM merchants WHERE id = $1'
    values =[@id]
    returned_tag = SqlRunner.run(sql, values)[0]
    return Merchant.new(returned_tag)
  end

  def update
    sql = 'UPDATE merchants SET name = ($1) WHERE id = $2'
    values = [@name,@id]
    SqlRunner.run(sql, values)
  end


  def delete
    sql = 'DELETE FROM merchants WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.all
    sql = 'SELECT * FROM merchants'
    returned_tag = SqlRunner.run(sql)
    return returned_tag.map { |tag| Merchant.new(tag) }
  end

  def self.delete_all
      sql = 'DELETE FROM merchants'
      SqlRunner.run(sql)
  end



end
