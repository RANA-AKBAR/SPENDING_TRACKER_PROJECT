require('sinatra')
require('sinatra/contrib/all')
require_relative("./models/merchant.rb")
require_relative("./models/spending_tag.rb")
require_relative("./models/transaction.rb")
require_relative("./db/sqlrunner.rb")
also_reload('./models/*')

get '/' do
  @transactions = Transaction.all
  erb(:index)
end

get '/transaction/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:index)
end
