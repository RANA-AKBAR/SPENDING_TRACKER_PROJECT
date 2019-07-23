require('sinatra')
require('sinatra/contrib/all')
require_relative("../models/merchant.rb")
require_relative("../models/spending_tag.rb")
require_relative("../models/transaction.rb")
require_relative("../db/sqlrunner.rb")
also_reload('../models/*')


get '/merchants' do
  @merchants = Merchant.all
  erb( :"merchants_views/merchant" )
end

get '/merchants/:id/edit' do
  @merchants = Merchant.find(params[:id])
  erb(:"merchants_views/editMerchant")
end

get '/merchants/new' do
  @merchants = Merchant.all()
  erb(:"merchants_views/newMerchant")
end

post '/merchants/:id' do
  Merchant.new( params).update
  redirect to '/merchants'
end

post '/merchants/:id/delete' do
   merchant = Merchant.find(params[:id])
   merchant.delete()
   redirect to '/merchants'
 end

post '/merchants/add/new' do
  @merchant = Merchant.new(params)
  @merchant.save()
  redirect to '/merchants'
end
