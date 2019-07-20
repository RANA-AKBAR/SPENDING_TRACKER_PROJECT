class Transaction
  attr_reader :id, :merchant_id, :spendingtag_id
  attr_accessor :amount, :date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id']
    @spendingtag_id = options['spendingtag_id']
    @amount = options['amount'].to_f if options['amount']
    @date = options['date']
  end

  def save
    sql = 'INSERT INTO transactions(type) VALUES ($1) RETURNING id'
    values = [@type]
    @id= SqlRunner.run(sql, values)[0]['id']

  end


  def transaction
    sql = 'SELECT * FROM transactions WHERE id = $1'
    values =[@id]
    returned_tag = SqlRunner.run(sql, values)[0]
    return Transaction.new(returned_tag)
  end

  def update
    sql = 'UPDATE transactions SET type = ($1) WHERE id = $2'
    values = [@type,@id]
    SqlRunner.run(sql, values)
  end


  def delete
    sql = 'DELETE FROM transactions WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.all
    sql = 'SELECT * FROM transactions'
    returned_tag = SqlRunner.run(sql)
    return returned_tag.map { |tag| Transaction.new(tag) }
  end

  def self.delete_all
      sql = 'DELETE FROM transactions'
      SqlRunner.run(sql)
  end
