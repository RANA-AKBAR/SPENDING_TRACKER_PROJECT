class User

  attr_accessor :name, :budget, :transactions
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @budget = options['budget']
    @transactions = options['transactions']
  end


end
