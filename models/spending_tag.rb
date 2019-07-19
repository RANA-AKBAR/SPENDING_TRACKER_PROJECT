class SpendingTag

  attr_accessor :name, :tag
  attr_reader :id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def read

  end

  def update

  end

  def delete

  end



end
