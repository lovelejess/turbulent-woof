require 'test/unit'
require_relative '../src/coin'

class CoinTest < Test::Unit::TestCase

  def test_is_valid_coin_returns_false_for_penny
    is_valid_coin = Coin.is_valid_coin('penny')
    assert_equal(false, is_valid_coin)
  end

  def test_is_valid_coin_returns_true_for_nickel
    is_valid_coin = Coin.is_valid_coin('nickel')
    assert_equal(true, is_valid_coin)
  end

end