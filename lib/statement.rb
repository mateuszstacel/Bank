require_relative "transactions.rb"

class Statement

  def initialize

  end

  def print_statement
    @transactions_history.each { |x| puts x }
  end

end
