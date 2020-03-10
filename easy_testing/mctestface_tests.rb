require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Value
  def odd?
    true
  end

  def downcase
    'xyz'
  end
end

class ValueTest < Minitest::Test
  attr_accessor :value

  def setup
    @value = Value.new
  end

  def test_odd
    assert value.odd?, "#{value} is not odd"
    assert_equal true, value.odd?
  end

  def test_downcase
    assert_equal 'xyz', value.downcase
  end

  def test_nil
    value = nil
    assert_nil value, "#{value} is not nil"
  end

  def test_empty
    list = []
    assert_empty list, 'list not empty'
  end

  def test_included
    list = ['xyz']
    assert_includes list, 'xyz'
  end
end
