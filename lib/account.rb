require_relative "transactions.rb"

class Account

 attr_reader :balance

  BALANCE = 0


  def initialize(transaction = Transactions.new)
    @balance = BALANCE
    @transaction = transaction
  end

  def top_up(amount)
    @balance += amount
    withdraw = 0
    @transaction.add(withdraw, amount, @balance)
  end

  def withdraw(amount)
    raise "Not enough funds!" if amount > @balance
    @balance -= amount
    top_up = 0
    @transaction.add(amount, top_up, @balance)
  end

   def check_tran
     @transaction.transactions_history
   end

   def statement
     @transaction.statement
   end

end
