require('sinatra')
require('sinatra/contrib/all')
require_relative("../models/merchant.rb")
require_relative("../models/spending_tag.rb")
require_relative("../models/transaction.rb")
require_relative("../db/sqlrunner.rb")
also_reload('../models/*')

get '/transactions' do
  @transactions = Transaction.all
  @total = Transaction.total_amount_spent()
  erb (:"transactions_views/transaction")
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id])
  @spendingtags = SpendingTag.all()
  @merchants = Merchant.all()
  erb(:"transactions_views/editTransaction")
end

get '/transactions/new' do
  @transactions = Transaction.all()
  @spendingtags = SpendingTag.all()
  @merchants = Merchant.all()
  erb(:"transactions_views/newTransaction")
end

post '/transactions/:id' do
  Transaction.new(params).update()
  redirect to '/transactions'
end

post '/transactions/:id/delete' do
  transaction = Transaction.find(params[:id])
  transaction.delete()
  redirect to '/transactions'
end

post '/transactions/add/new' do
  @transaction = Transaction.new(params)
  @transaction.save()
  redirect to '/transactions'
end
