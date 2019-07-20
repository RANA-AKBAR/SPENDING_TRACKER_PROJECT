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
    @tag = Transaction.new({'name' => 'asda'})
  end

  def test_has_id
    @tag.save
    result = @tag.id.to_i
    assert_equal(true, result.integer?)
  end

  def test_has_name
  assert_equal('asda', @tag.name)
  end

  def test_returns_tags
    @tag.save
    assert_equal('asda', @tag.transaction.name)
  end

  def test_updates
    @tag.save
    @tag.name = 'spar'
    @tag.update
    assert_equal('spar', @tag.name)
  end

  def test_delete
    @tag.save
    @tag.delete
    assert_equal(false, Transaction.all.include?(@tag))
  end


  def test_delete_all
    @tag.save
    Transaction.delete_all
    assert_equal(0, Transaction.all.count())
  end


end
