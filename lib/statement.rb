# statement
class Statement
  attr_reader :statement
  def initialize
    @statement = []
  end

  def add(date, withdraw, top_up, balance)
    @statement.push([date, withdraw, top_up, balance])
  end

  def transactions_statement
    print "Date || Credit || Debit || Balance\n"
    @statement.reverse_each do |x|
      print "#{x[0]} || #{statement_format(x[1])} || #{statement_format(x[2])} || #{statement_format(x[3])}\n"
    end
  end

private

  def statement_format(amount)
    if amount == ""
      return ""
    else
    '%.2f' % amount
    end
  end
end
