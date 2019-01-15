require_relative 'transactions.rb'
require 'date'
# account
class Account
  attr_reader :balance

  def initialize(transaction = Transactions.new, date = Time.now)
    @balance = 0
    @transaction = transaction
    @date = date.strftime('%d/%m/%Y')
  end

  def top_up(amount)
    @balance += amount
    withdraw = ''
    @transaction.add(@date, withdraw, amount, @balance)
  end

  def withdraw(amount)
    raise 'Not enough funds!' if amount > @balance

    @balance -= amount
    top_up = ''
    @transaction.add(@date, amount, top_up, @balance)
  end

  def statement
    @transaction.transactions_statement
  end
end
