require 'minitest/autorun'

class Odd
  def odd?
    false
  end
end

class OddTest < Minitest::Test
  def test_odd
    value = Odd.new
    assert value.odd?, "#{value} is not odd"
    assert_equal true, value.odd?
  end


end
