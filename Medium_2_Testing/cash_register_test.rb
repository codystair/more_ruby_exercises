require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(250)
  end

  def test_accept_money
    @transaction.amount_paid = 250
    
    before = @register.total_money
    @register.accept_money(@transaction)
    after = @register.total_money

    assert_equal before + 250, after
  end

  def test_change
    @transaction.amount_paid = 300
    assert 50, @register.change(@transaction)
  end

  def test_give_receipt
    assert_output("You've paid $#{@transaction.item_cost}.\n") do
      @register.give_receipt(@transaction)
    end
  end
end
