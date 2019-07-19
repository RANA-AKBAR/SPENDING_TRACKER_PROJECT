require "minitest/autorun"
require "minitest/rg"
require "pry"
require_relative("../models/spending_tag.rb")
require_relative("../db/sqlrunner.rb")


class SpendingTagTest < MiniTest::Test

  def setup()
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

end
