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
    else
      change = @coin_balance - product_cost
      make_change(change)
      return product
    end

  end

  def insert_coins(coins)
    coins.each do |coin|
      if Coin.is_valid_coin(coin)
        @coin_balance += Coin.coin_value(coin)
      else
        add_coin_return coin
      end
    end
    return @coin_balance
  end

  def return_coins
    make_change(@coin_balance)
    @coin_balance = 0
    display_message_for_inserted_coin(0)
    return @coin_return
  end

  private

  def calculate_number_of_coins_for_type(coin_amount, type)
    value = Coin.coin_value(type)
    num_of_coins = coin_amount / value

      (1..num_of_coins).each do
        add_coin_return(type)
      end
      return num_of_coins * value
  end

  def make_change(coin_amount)
      Coin.coin_enum.keys.each do |type|
        if coin_amount > 0
          coin_amount -= calculate_number_of_coins_for_type(coin_amount, type.to_s)
        end
      end
  end

  def add_coin_return(coin)
    @coin_return.push coin
  end

  def reset_transaction
    @coin_balance = 0
    display_message_for_inserted_coin(0)
  end

end