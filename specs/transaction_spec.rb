require "minitest/autorun"
require "minitest/rg"
require "pry"
require_relative("../models/merchant.rb")
require_relative("../models/spending_tag.rb")
require_relative("../models/transaction.rb")
require_relative("../db/sqlrunner.rb")


class TransactionTest < MiniTest::Test

  def setup()
    Transaction.delete_all
    @transaction1 = Transaction.new({'amount' => 1.1, 'date' => '06/23/2222'})
    @transaction2 = Transaction.new({'amount' => 23.25, 'date' => '06/23/2022'})
    @transaction3 = Transaction.new({'amount' => 3.13, 'date' => '06/23/2012'})
    @transaction4 = Transaction.new({'amount' => 4.1, 'date' => '06/23/2001'})
    @transaction1.save
    @transaction2.save
    @transaction3.save
    @transaction4.save
  end

  def test_has_id
    @transaction1.save
    result = @transaction1.id.to_i
    assert_equal(true, result.integer?)
  end
  #
  # def test_has_name
  #   assert_equal(1.0, @transaction1.amount)
  # end
  #
  # def test_returns_tags
  #   @transaction1.save
  #   assert_equal(1.0, @transaction1.transaction.amount)
  # end
  #
  # def test_updates
  #   @transaction1.save
  #   @transaction1.amount = 2
  #   @transaction1.update
  #   assert_equal(2.0, @transaction1.amount)
  # end
  #
  # def test_delete
  #   @transaction1.save
  #   @transaction1.delete
  #   assert_equal(false, Transaction.all.include?(@transaction1))
  # end
  #
  #
  # def test_delete_all
  #   @transaction1.save
  #   Transaction.delete_all
  #   assert_equal(0, Transaction.all.count())
  # end


end
