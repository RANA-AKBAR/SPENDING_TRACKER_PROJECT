require('sinatra')
require('sinatra/contrib/all')
require_relative("../models/merchant.rb")
require_relative("../models/spending_tag.rb")
require_relative("../models/transaction.rb")
require_relative("../db/sqlrunner.rb")
also_reload('../models/*')


get '/spendingtags' do
  @spendingtags = SpendingTag.all()
  erb(:"spendingtag_views/spendingtag")
end

get '/spendingtags/:id/edit' do
  @spendingtag = SpendingTag.find(params[:id])
  erb(:"spendingtag_views/editSpendingtag")
end

get '/spendingtags/new' do
  @spendingtags = SpendingTag.all()
  erb(:"spendingtag_views/newSpendingtag")
end

post '/spendingtags/:id' do
  @spendingtag = SpendingTag.new(params)
  @spendingtag.update
  redirect to '/spendingtags'
end

post '/spendingtags/:id/delete' do
  @spendingtag = SpendingTag.find(params[:id])
  @spendingtag.delete()
  redirect to '/spendingtags'

end

post '/spendingtags/add/new' do
  @spendingtag = SpendingTag.new(params)
  @spendingtag.save()
  redirect to '/spendingtags'
end
