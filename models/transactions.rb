class Transactions
  attr_reader :id, :merchant_id, :spendingtag_id
  attr_accessor :amount, :date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id']
    @spendingtag_id = options['spendingtag_id']
    @amount = options['amount'].to_f if options['amount']
    @date = options['date']
  end

  def read

  end

  def update

  end

  def delete

  end
end
