class Coin

  def self.coin_enum
    {:nickel => 5, :dime => 10, :quarter => 25}
  end

  def self.is_valid_coin(coin)
    coin_enum.include? coin.to_sym
  end

  def self.coin_value(coin)
    coin_enum[coin.to_sym]
  end

end