require "minitest/autorun"
require "minitest/rg"
require "pry"
require_relative("../models/spending_tag.rb")
require_relative("../db/sqlrunner.rb")


class SpendingTagTest < MiniTest::Test

  def setup()
    SpendingTag.delete_all
    @tag = SpendingTag.new({'type' => 'gym'})
  end

  def test_has_id
    @tag.save
    result = @tag.id.to_i
    assert_equal(true, result.integer?)
  end

  def test_has_type
  assert_equal('gym', @tag.type)
  end

  def test_returns_tags
    @tag.save
    assert_equal('gym', @tag.spendingtag.type)
  end

  def test_updates
    @tag.save
    @tag.type = 'spar'
    @tag.update
    assert_equal('spar', @tag.type)
  end

  def test_delete
    @tag.save
    @tag.delete
    assert_equal(false, SpendingTag.all.include?(@tag))
  end


  def test_delete_all
    @tag.save
    SpendingTag.delete_all
    assert_equal(0, SpendingTag.all.count())
  end


end
