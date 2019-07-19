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

#
#   def spendingtag
#     sql = 'SELECT * FROM spendingtags WHERE id = $1'
#     values =[@id]
#     return SqlRunner.run(sql, values)
#   end
#
#   def update
#
#   end
#
#   def delete
#
#   end
#
#
#
end
