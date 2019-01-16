# statement
class Statement


  def initialize
    @statement = []
  end

  def add(date, withdraw, top_up, balance)
    @statement.push([date, withdraw, top_up, balance])
  end

  def transactions_statement
    print "Date || Credit || Debit || Balance\n"
    @statement.reverse_each do |x|
      print "#{x[0]} || #{x[1]} || #{x[2]} || #{x[3]}\n"
    end
  end

  def statement_format(amount)
    '%.2f' % amount
  end

  def statement
    @statement
  end

end
