# transactions
class Transactions
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def credit(amount)
    @balance += amount
  end

  def debit(amount)
    @balance -= amount
  end

  def format(amount)
    '%.2f' % amount
  end

end
