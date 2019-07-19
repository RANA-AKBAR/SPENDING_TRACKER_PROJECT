class Merchant

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def read
    sql = w

  end

  def update

  end

  def delete

  end



end
