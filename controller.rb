require('sinatra')
require('sinatra/contrib/all')
require_relative("./models/merchant.rb")
require_relative("./models/spending_tag.rb")
require_relative("./models/transaction.rb")
require_relative("./db/sqlrunner.rb")
also_reload('./models/*')

# get '/' do
#   @transactions = Transaction.all
#   erb(:index)
# end
#
# get '/transaction/:id' do
#    return @transaction = Transaction.find(params[:id])
#   erb(:transaction)
#
#
# end


get '/' do
  @transactions = Transaction.all
  erb(:index)
end

get '/transaction/new' do
  @transaction = Transaction.all
  erb(:new)
end

post '/transaction' do
  Transaction.new(params).save
  redirect to '/transactions'
end

get '/transaction/:id' do
  @transaction = Transaction.find(params['id'])
  erb(:transaction)
end

get '/transaction/:id/edit' do
  @transaction = Transaction.all
  @transaction = Transaction.find(params['id'])
  erb(:edit)
end

post '/transaction/:id' do
  transaction = Transaction.new(params)
  transaction.update
  redirect to "/transaction/#{params['id']}"
end

post '/transaction/:id/delete' do
  transaction = Transaction.find(params['id'])
  transaction.delete
  redirect to '/transaction'
end
