require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'employee.rb'

class EmployeeTest < Minitest::Test
  attr_accessor :employee

  def setup
    @employee = Employee.new
  end

  def test_hire
    assert_raises NoExperienceError do
      employee.hire
    end
  end

  def test_type_asserts
    value = Numeric.new
    assert_instance_of Numeric, value
  end

  def test_kind_asserts
    value = 1r
    assert_kind_of Numeric, value
  end
end
