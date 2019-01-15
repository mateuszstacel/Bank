require_relative 'transactions.rb'
require_relative 'statement.rb'
require 'date'
# account
class Account

  def initialize(transaction = Transactions.new, statement = Statement.new)
    @statement = statement
    @transaction = transaction
  end


  def top_up(amount)
    date = Time.now.strftime('%d/%m/%Y')
    @transaction.credit(amount)
    withdraw = ''
    @statement.add(date, withdraw, amount, @transaction.balance)
  end

  def withdraw(amount)
    raise 'Not enough funds!' if amount > @transaction.balance

    date = Time.now.strftime('%d/%m/%Y')
    @transaction.debit(amount)
    top_up = ''
    @statement.add(date, amount, top_up, @transaction.balance)
  end

  def statement
    @statement.transactions_statement
  end
end
