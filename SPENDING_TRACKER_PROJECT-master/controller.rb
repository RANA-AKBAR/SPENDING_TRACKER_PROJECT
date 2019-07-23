# require('sinatra')
# require('sinatra/contrib/all')
# require_relative("./models/merchant.rb")
# require_relative("./models/spending_tag.rb")
# require_relative("./models/transaction.rb")
# require_relative("./db/sqlrunner.rb")
# also_reload('./models/*')
#
#
# get '/merchants' do
#   @merchants = Merchant.all
#   erb(:merchant)
# end
#
# get '/merchants/:id/edit' do
#   @merchants = Merchant.find(params[:id])
#   erb(:editMerchant)
# end
#
# get '/merchants/new' do
#   @merchants = Merchant.all()
#   erb(:newMerchant)
# end
#
# post '/merchants/:id' do
#   Merchant.new( params).update
#   redirect to '/merchants'
# end
#
# post '/merchants/:id/delete' do
#    merchant = Merchant.find(params[:id])
#    merchant.delete()
#    redirect to '/merchants'
#  end
#
# post '/merchants/add/new' do
#   @merchant = Merchant.new(params)
#   @merchant.save()
#   redirect to '/merchants'
# end




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


# get '/' do
#   @transactions = Transaction.all
#   erb(:index)
# end
#
# get '/transaction/new' do
#   @transaction = Transaction.all
#   erb(:new)
# end
#
# post '/transaction' do
#   Transaction.new(params).save
#   redirect to '/transactions'
# end
#
# get '/transaction/:id' do
#   @transaction = Transaction.find(params['id'])
#   erb(:transaction)
# end
#
# get '/transaction/:id/edit' do
#   @transaction = Transaction.all
#   @transaction = Transaction.find(params['id'])
#   erb(:edit)
# end
#
# post '/transaction/:id' do
#   transaction = Transaction.new(params)
#   transaction.update
#   redirect to "/transaction/#{params['id']}"
# end
#
# post '/transaction/:id/delete' do
#   transaction = Transaction.find(params['id'])
#   transaction.delete
#   redirect to '/transaction'
# end
