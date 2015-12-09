require 'test/unit'

require_relative '../src/vending_machine'

class VendingMachineTest < Test::Unit::TestCase

  def test_insert_coins_returns_0_when_no_coins_inserted
    vending_machine = VendingMachine.new
    assert_equal(0, vending_machine.insert_coins(['']))
  end

  def test_insert_coins_returns_10_cents_when_dime_inserted
    vending_machine = VendingMachine.new
    assert_equal(10, vending_machine.insert_coins(['dime']))
  end

  def test_insert_coins_returns_40_cents_when_nickle_dime_quarters_inserted
    vending_machine = VendingMachine.new
    assert_equal(40, vending_machine.insert_coins(['nickel','dime', 'quarter']))
  end

  def test_insert_coins_returns_0
    vending_machine = VendingMachine.new
    assert_equal(0, vending_machine.insert_coins(['penny']))
  end

  def test_display_message_for_inserted_coin_returns_COINS_INSERTED_40_CENTS_when_multiple_coins_inserted
    vending_machine = VendingMachine.new
    coin_balance = vending_machine.insert_coins(['nickel','dime', 'quarter'])
    assert_equal('COINS INSERTED: 40 CENTS', vending_machine.display_message_for_inserted_coin(coin_balance))
  end

  def test_display_message_for_inserted_coin_returns_insert_coins_when_no_coins_inserted
    vending_machine = VendingMachine.new
    coin_balance = vending_machine.insert_coins([''])
    assert_equal('INSERT COINS', vending_machine.display_message_for_inserted_coin(coin_balance))
  end

  def test_coin_return_returns_invalid_coin_penny
    vending_machine = VendingMachine.new
    assert_equal(['penny'], vending_machine.add_coin_return('penny'))
  end

end