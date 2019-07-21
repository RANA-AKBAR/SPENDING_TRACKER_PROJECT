class Transaction
  attr_reader :id, :merchant_id, :spendingtag_id
  attr_accessor :amount, :date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_f
    @date = options['date']
    @spendingtag_id = options['spendingtag_id']
    @merchant_id = options['merchant_id']
  end

  def save
    sql = 'INSERT INTO transactions(amount, date, spendingtag_id, merchant_id) VALUES ($1,$2,$3,$4) RETURNING id'
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
    sql = 'UPDATE transactions SET (amount, date, spendingtag_id, merchant_id) = ($1, $2, $3, $4) WHERE id = $5'
    values = [@amount, @date,@spendingtag_id, @merchant_id, @id]
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

  def self.find(id)
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    transaction = Transaction.new(result)
    return transaction
  end


end
