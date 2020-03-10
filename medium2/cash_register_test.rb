require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require 'pry'

require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class CashRegisterTest < Minitest::Test
  attr_accessor :cr, :tran
  def setup
    @cr = CashRegister.new 1000
    @tran = Transaction.new(3)
    tran.amount_paid = 30
  end

  def test_test
    assert true
  end

  def test_accept_money
    previous_total = cr.total_money
    cr.accept_money tran
    assert_equal previous_total + tran.amount_paid, cr.total_money
  end

  def test_change
    change = cr.change tran
    assert_equal 27, change
  end

  def test_give_receipt
    out = "You've paid $3.\n"
    assert_output out do cr.give_receipt tran end
  end
end
