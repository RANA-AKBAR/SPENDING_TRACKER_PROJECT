require_relative('models/merchant.rb')
require_relative('models/spending_tag.rb')
require_relative('models/transaction.rb')
require 'time'
require('pry-byebug')

Transaction.delete_all()
Merchant.delete_all()
SpendingTag.delete_all()

merchant_1 = Merchant.new({'name' => 'Tesco'})
merchant_2 = Merchant.new({'name' => 'Amazon'})
merchant_3 = Merchant.new({'name' => '  Scotrail'})
merchant_4 = Merchant.new({'name' => 'Lidl'})

merchant_1.save()
merchant_2.save()
merchant_3.save()
merchant_4.save()

Merchant.all()
Merchant.find(merchant_1.id)

spending_tag_1 = SpendingTag.new({'type' => 'transport'})
spending_tag_2 = SpendingTag.new({'type' => 'groceries'})
spending_tag_3 = SpendingTag.new({'type' => 'entertainment'})

spending_tag_1.save()
spending_tag_2.save()
spending_tag_3.save()

SpendingTag.find(spending_tag_1.id)

transection_1 = Transaction.new({'amount' => 30.0, 'date' => Time.local(2019, 7, 8, 9, 10)   , 'spendingtag_id' => spending_tag_2.id, 'merchant_id' => merchant_1.id})
transection_2 = Transaction.new({'amount' => 45.0, 'date' => Time.local(2019, 7, 9, 10, 10)   , 'spendingtag_id' => spending_tag_3.id, 'merchant_id' => merchant_2.id})
transection_3 = Transaction.new({'amount' => 75.0, 'date' => Time.local(2019, 6, 10, 11, 10)   , 'spendingtag_id' => spending_tag_1.id, 'merchant_id' => merchant_3.id})
transection_4 = Transaction.new({'amount' => 20.0, 'date' => Time.local(2019, 7, 11, 12, 10)   , 'spendingtag_id' => spending_tag_3.id, 'merchant_id' => merchant_1.id})
transection_5 = Transaction.new({'amount' => 15.0, 'date' => Time.local(2019, 7, 14, 13, 10)   , 'spendingtag_id' => spending_tag_2.id, 'merchant_id' => merchant_4.id})

transection_1.save()
transection_2.save()
transection_3.save()
transection_4.save()
transection_5.save()

Transaction.total_amount_spent()
Transaction.select_specific_spendingtags(spending_tag_2.id)

binding.pry
nil
