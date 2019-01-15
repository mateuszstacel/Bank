require 'date'
# transactions
class Transactions

  attr_reader :transactions_history

  def initialize
    @transactions_history = []
  end

  def add(date, withdraw, top_up, balance)
    @transactions_history.push([date, withdraw, top_up, balance])
  end

  def transactions_statement
    i = 0
    @transactions_history = @transactions_history.reverse
    print "Date || Credit || Debit || Balance\n"
    while i < @transactions_history.length do
      @transactions_history[i].each { |x| print x.to_s + " || " }
      print "\n"
      i += 1
    end
  end
end
