require('sinatra')
require('sinatra/contrib/all')
require_relative("./models/merchant.rb")
require_relative("./models/spending_tag.rb")
require_relative("./models/transaction.rb")
require_relative("./db/sqlrunner.rb")
also_reload('./models/*')

get '/' do
  @transaction1 = Transaction.new({'amount' => 1, 'date' => '06/23//1989'})
  @transaction = Transaction.all
  erb(:index)
end
