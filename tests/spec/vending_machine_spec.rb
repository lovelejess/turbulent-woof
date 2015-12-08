require 'rspec'
require_relative '../../vending_machine'

describe 'Vending Machine' do

  context 'valid coins' do
    it 'accepts nickels and displays the value' do
      vending_machine = VendingMachine.new
      insert_coin_result = vending_machine.insert 'nickel'
      expect(insert_coin_result).to eq 'COINS INSERTED: 5 CENTS'
    end
  end

  context 'invalid coins' do
    it 'does not accept pennies and displays INSERT COIN' do
      vending_machine = VendingMachine.new
      insert_coin_result = vending_machine.insert 'penny'
      expect(insert_coin_result).to eq 'INSERT COINS'
    end
  end

end