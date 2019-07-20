class Transaction
  attr_reader :id, :merchant_id, :spendingtag_id
  attr_accessor :amount, :date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_f if options['amount']
    @date = options['date']
    @spendingtag_id = options['spendingtag_id']
    @merchant_id = options['merchant_id']
  end

  def save
    sql = 'INSERT INTO transactions(amount) VALUES ($1) RETURNING id'
    values = [@amount, @date,@spendingtag_id, @merchant_id]
    @id= SqlRunner.run(sql, values)[0]['id']

  end


  def transaction
    sql = 'SELECT * FROM transactions WHERE id = $1'
    values =[@id]
    returned_tag = SqlRunner.run(sql, values)[0]
    return Transaction.new(returned_tag)
  end

  def update
    sql = 'UPDATE transactions SET amount = ($1) WHERE id = $2'
    values = [@amount,@id]
    SqlRunner.run(sql, values)
  end


  def delete
    sql = 'DELETE FROM transactions WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.all
    sql = 'SELECT * FROM transactions'
    returned_transactions = SqlRunner.run(sql)
    return returned_transactions.map { |single_transaction| Transaction.new(single_transaction) }
  end

  def self.delete_all
      sql = 'DELETE FROM transactions'
      SqlRunner.run(sql)
  end
