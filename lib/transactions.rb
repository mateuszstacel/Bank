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
    print "Date || Credit || Debit || Balance\n"
    @transactions_history.reverse.each do |x|
      print  "#{x[0]} || #{x[1]} ||#{x[2]} ||#{x[3]}\n"
    end
  end
end
