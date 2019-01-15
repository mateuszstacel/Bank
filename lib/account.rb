require_relative "transactions.rb"
require 'date'

class Account

 attr_reader :balance

  BALANCE = 0


  def initialize(transaction = Transactions.new, date = Time.now)
    @balance = BALANCE
    @transaction = transaction
    @date = date.strftime("%d/%m/%Y")
  end

  def top_up(amount)
    @balance += amount
    withdraw = 0
    @transaction.add(@date, withdraw, amount, @balance)
  end

  def withdraw(amount)
    raise "Not enough funds!" if amount > @balance
    @balance -= amount
    top_up = 0
    @transaction.add(@date, amount, top_up, @balance)
  end

   def statement
     @transaction.transactions_statement
   end

end
