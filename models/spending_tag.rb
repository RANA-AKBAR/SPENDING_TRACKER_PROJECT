class SpendingTag

  attr_accessor :type
  attr_reader :id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end

  def save
    sql = 'INSERT INTO spendingtags(type) VALUES ($1) RETURNING id'
    values = [@type]
    @id= SqlRunner.run(sql, values)[0]['id']

  end


  def spendingtag
    sql = 'SELECT * FROM spendingtags WHERE id = $1'
    values =[@id]
    returned_tag = SqlRunner.run(sql, values)[0]
    return SpendingTag.new(returned_tag)
  end

  def update
    sql = 'UPDATE spendingtags SET type = ($1) WHERE id = $2'
    values = [@type,@id]
    SqlRunner.run(sql, values)
  end


  def delete
    sql = 'DELETE FROM spendingtags WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.find(id)
    sql = "SELECT * FROM spendingtags
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    tag = SpendingTag.new(result)
    return tag
  end

  def self.delete_all
      sql = 'DELETE FROM spendingtags'
      SqlRunner.run(sql)
  end

  #
  #
end
