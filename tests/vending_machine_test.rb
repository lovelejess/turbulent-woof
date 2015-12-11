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

  def test_select_product_cola_returns_product_when_enough_money_is_inserted
    vending_machine = VendingMachine.new
    vending_machine.insert_coins(['quarter', 'quarter', 'quarter','quarter'])
    dispensed_item = vending_machine.select_product('cola')
    assert_equal('cola', dispensed_item)
  end

  def test_select_product_cola_displays_thank_you_and_insert_coins_when_enough_money_is_inserted
    vending_machine = VendingMachine.new
    vending_machine.insert_coins(['quarter', 'quarter', 'quarter','quarter'])
    vending_machine.select_product('cola')
    assert_equal('THANK YOU',vending_machine.product_transaction_message)
    assert_equal('INSERT COINS',vending_machine.display_message)
  end

  def test_select_product_cola_resets_balance_to_zero_when_enough_money_is_inserted
    vending_machine = VendingMachine.new
    vending_machine.insert_coins(['quarter', 'quarter', 'quarter','quarter'])
    vending_machine.select_product('cola')
    assert_equal(0,vending_machine.coin_balance)
  end

  def test_select_product_cola_displays_PRICE_then_balance_when_not_enough_money_is_inserted
    vending_machine = VendingMachine.new
    vending_machine.insert_coins(['quarter', 'quarter', 'quarter'])
    vending_machine.select_product('cola')
    assert_equal('PRICE: 100 CENTS',vending_machine.product_transaction_message) #TODO: convert 100 cents to 1.00
    assert_equal('COINS INSERTED: 75 CENTS',vending_machine.display_message)
  end

  def test_a_quarter_is_returned_when_25_cents_inserted_more_than_cost_of_product
    vending_machine = VendingMachine.new
    vending_machine.insert_coins ['quarter', 'quarter','quarter', 'nickel', 'dime']
    dispensed_product = vending_machine.select_product('candy')
    assert_equal(90,vending_machine.coin_balance)
    assert_equal('candy', dispensed_product)
    assert_equal(['quarter'], vending_machine.coin_return)
  end

  def test_a_dime_is_returned_when_10_cents_inserted_more_than_cost_of_product
    vending_machine = VendingMachine.new
    vending_machine.insert_coins ['quarter', 'quarter','quarter', 'nickel', 'dime','dime']
    dispensed_product = vending_machine.select_product('candy')
    assert_equal(100,vending_machine.coin_balance)
    assert_equal('candy', dispensed_product)
    assert_equal(['quarter', 'dime'], vending_machine.coin_return)
  end

  def test_a_dime_quarter_nickel_are_returned_when_35_cents_inserted_more_than_cost_of_product
    vending_machine = VendingMachine.new
    vending_machine.insert_coins ['quarter', 'quarter','quarter', 'nickel', 'dime','dime','nickel']
    dispensed_product = vending_machine.select_product('candy')
    assert_equal(105,vending_machine.coin_balance)
    assert_equal('candy', dispensed_product)
    assert_equal(['quarter', 'dime','nickel'], vending_machine.coin_return)
  end

  def test_return_coins_returns_inserted_coins
    vending_machine = VendingMachine.new
    vending_machine.insert_coins ['penny', 'nickel', 'dime']
    returned_coins = vending_machine.return_coins
    assert_equal(['penny', 'dime', 'nickel'],returned_coins)
    assert_equal('INSERT COINS', vending_machine.display_message)
    assert_equal(0, vending_machine.coin_balance)
  end

end