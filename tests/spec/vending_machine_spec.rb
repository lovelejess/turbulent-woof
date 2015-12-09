require 'rspec'
require_relative '../../src/vending_machine'

describe 'Vending Machine' do

  context 'valid coins' do
    it 'accepts a nickel and displays the value' do
      vending_machine = VendingMachine.new
      coin_balance = vending_machine.insert_coins ['nickel']
      display_message = vending_machine.display_message_for_inserted_coin coin_balance
      expect(display_message).to eq 'COINS INSERTED: 5 CENTS'
    end

    it 'accepts multiple coins and displays the value' do
      vending_machine = VendingMachine.new
      coin_balance = vending_machine.insert_coins ['nickel', 'dime', 'quarter']
      display_message = vending_machine.display_message_for_inserted_coin coin_balance
      expect(display_message).to eq 'COINS INSERTED: 40 CENTS'
    end

  end

  context 'invalid coins' do
    it 'rejects pennies and displays INSERT COINS' do #need to figure out how to reject coins
      vending_machine = VendingMachine.new
      coin_balance = vending_machine.insert_coins ['penny']
      display_message = vending_machine.display_message_for_inserted_coin coin_balance
      expect(display_message).to eq 'INSERT COINS'
      # expect(vending_machine.add_coin_return coin_balance).to eq 'INSERT COINS'
    end

    it 'displays INSERT COIN when no coins are inserted' do
      vending_machine = VendingMachine.new
      coin_balance = vending_machine.insert_coins ['']
      display_message = vending_machine.display_message_for_inserted_coin coin_balance
      expect(display_message).to eq 'INSERT COINS'
    end

    it 'rejects pennies but displays the valid coin values ' do #need to figure out how to reject coins
      vending_machine = VendingMachine.new
      coin_balance = vending_machine.insert_coins ['penny', 'nickel', 'dime']
      display_message = vending_machine.display_message_for_inserted_coin coin_balance
      expect(display_message).to eq 'COINS INSERTED: 15 CENTS'
    end

  end

end