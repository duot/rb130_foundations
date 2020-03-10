require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'list.rb'

class ListTest < Minitest::Test
  attr_accessor :list

  def setup
    @list = List.new
  end

  def test_same_obj
    assert_same list, list.process
  end

  def test_exclude
    list = []
    refute_includes list, 'xyz'
  end
end
