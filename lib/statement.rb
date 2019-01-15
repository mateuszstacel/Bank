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
    @statement.reverse.each do |x|
      print  "#{x[0]} || #{x[1]} || #{x[2]} || #{x[3]}\n"
    end
  end
end