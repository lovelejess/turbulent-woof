class VendingMachine

  def coin_enum
    {:nickel => 5, :dime => 10, :quarter => 25}
  end

  def is_valid_coin(coin)
    coin_enum.include? coin.to_sym
  end

  def coin_value(coin)
    coin_enum[coin.to_sym]
  end

  def return_invalid_coin(coin)
    coin
  end

  def display_message_for_inserted_coin(coin)
    if is_valid_coin coin
      return "COINS INSERTED: #{coin_value(coin)} CENTS"
    else
      return_invalid_coin(coin)
      return 'INSERT COINS'
    end
  end

  def insert(coin)
    display_message_for_inserted_coin(coin)
  end
end