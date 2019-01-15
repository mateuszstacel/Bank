require_relative 'transactions.rb'
require 'date'
# account
class Account

  def initialize(transaction = Transactions.new)
    @balance = 0
    @transaction = transaction
  end

  def top_up(amount)
    date = Time.now.strftime('%d/%m/%Y')
    @balance += amount
    withdraw = ''
    @transaction.add(date, withdraw, amount, @balance)
  end

  def withdraw(amount)
    raise 'Not enough funds!' if amount > @balance

    date = Time.now.strftime('%d/%m/%Y')
    @balance -= amount
    top_up = ''
    @transaction.add(date, amount, top_up, @balance)
  end

  def statement
    @transaction.transactions_statement
  end
end
