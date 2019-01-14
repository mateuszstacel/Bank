require 'date'

class Transactions

  attr_reader :transactions_history


  def initialize(date = Time.now)
    @date = date.strftime("%d/%m/%Y")
    @transactions_history = []
  end

  def add(withdraw, top_up, balance)
    @transactions_history.push([@date, withdraw, top_up, balance])
  end

  def statement
    
  end

end
