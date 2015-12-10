require_relative 'coin'
require_relative 'product'

class VendingMachine

  attr_reader :coin_return
  attr_reader :coin_balance
  attr_reader :display_message
  attr_reader :product_transaction_message

  def initialize
    @coin_return = []
    @coin_balance = 0
  end

  def display_message_for_inserted_coin(coins)
    if coins > 0
      @display_message = "COINS INSERTED: #{coins} CENTS"
    else
      @display_message = 'INSERT COINS'
    end
  end

  def select_product(product)
    product_cost = Product.product[product.to_sym]
    if @coin_balance == product_cost
      @product_transaction_message = 'THANK YOU'
      reset_transaction
      return product
    elsif @coin_balance < product_cost
      @product_transaction_message = "PRICE: #{product_cost} CENTS"
      display_message_for_inserted_coin(@coin_balance)
      return nil
    end

  end

  def insert_coins(coins)
    coins.each do |coin|
      if Coin.is_valid_coin(coin)
        @coin_balance = @coin_balance + Coin.coin_value(coin)
      else
        add_coin_return coin
      end
    end
    return @coin_balance
  end

  private

  def add_coin_return(coin)
    @coin_return.push coin
  end

  def reset_transaction
    @coin_balance = 0
    display_message_for_inserted_coin(0)
  end

end