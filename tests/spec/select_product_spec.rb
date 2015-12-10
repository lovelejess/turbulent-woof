require 'rspec'

describe 'Select Product' do

  context 'happy path - enough money to buy product' do
    it 'selects a cola, inserts exact amount, dispense cola, and displays thank you, then INSERT COINS' do
      vending_machine = VendingMachine.new
      vending_machine.insert_coins(['quarter', 'quarter', 'quarter','quarter'])
      dispensed_product = vending_machine.select_product('cola')
      expect(dispensed_product).to eq 'cola'
      expect(vending_machine.product_transaction_message).to eq 'THANK YOU'
      expect(vending_machine.display_message).to eq 'INSERT COINS'
    end

  end

  context 'unhappy path - not enough money to buy product' do
    it 'selects a cola, inserts 10 cents too few, displays PRICE, then current amount ' do
      vending_machine = VendingMachine.new
      vending_machine.insert_coins ['nickel']
      dispensed_product = vending_machine.select_product('cola')
      expect(dispensed_product).to eq nil
      expect(vending_machine.product_transaction_message).to eq 'PRICE: 100 CENTS'
      expect(vending_machine.display_message).to eq 'COINS INSERTED: 5 CENTS' #TODO INSERT COINS
    end
  end
end