require 'test/unit'

require_relative '../vending_machine'

class VendingMachineTest < Test::Unit::TestCase

  def test_is_valid_coin_returns_false_for_penny
    vending_machine = VendingMachine.new
    is_valid_coin = vending_machine.is_valid_coin('penny')
    assert_equal(false, is_valid_coin)
  end

  def test_is_valid_coin_returns_true_for_nickel
    vending_machine = VendingMachine.new
    is_valid_coin = vending_machine.is_valid_coin('nickel')
    assert_equal(true, is_valid_coin)
  end

  def test_display_message_returns_insert_coins_when_no_coins_inserted
    vending_machine = VendingMachine.new
    assert_equal('INSERT COINS', vending_machine.display_message_for_inserted_coin(''))
  end

  def test_display_message_returns_10_cents_when_dime_inserted
    vending_machine = VendingMachine.new
    assert_equal('COINS INSERTED: 10 CENTS', vending_machine.display_message_for_inserted_coin('dime'))
  end

end