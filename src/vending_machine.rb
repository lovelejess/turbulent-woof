require_relative 'coin'

class VendingMachine

  attr_reader :coin_return

  def initialize
    @coin_return = []
  end

  def add_coin_return(coin)
    @coin_return.push coin
  end

  def coin_return
    @coin_return
  end

  def display_message_for_inserted_coin(coins)
    if coins > 0
      return "COINS INSERTED: #{coins} CENTS"
    else
      return 'INSERT COINS'
    end
  end

  def insert_coins(coins)
    coin_balance = 0
    coins.each do |coin|
      if Coin.is_valid_coin(coin)
        coin_balance = coin_balance + Coin.coin_value(coin)
      else
        add_coin_return coin
      end
    end
    return coin_balance
  end

end