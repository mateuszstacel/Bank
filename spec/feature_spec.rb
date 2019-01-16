require 'timecop'
require 'account'
require 'transactions'
require 'statement'


describe Account do

  let(:account) { Account.new }

  describe '#statement' do
    it 'prints statement without transasctions' do
      expect { account.statement }.to output("Date || Credit || Debit || Balance\n").to_stdout
    end
    it 'prints a statement with any deposits or withdrawals in reverse chronological order' do
      deposit_1
      deposit_2
      withdraw
      expect { account.statement }.to output("Date || Credit || Debit || Balance\n10/10/2019 || 500.00 ||  || 500.00\n10/10/2018 ||  || 500.00 || 1000.00\n10/10/2017 ||  || 500.00 || 500.00\n").to_stdout
    end
  end

  def deposit_1
    Timecop.freeze(Time.local(2017, 10, 10))
    account.top_up(500)
  end

  def deposit_2
    Timecop.freeze(Time.local(2018, 10, 10))
    account.top_up(500)
  end

  def withdraw
    Timecop.freeze(Time.local(2019, 10, 10))
    account.withdraw(500)
  end
end
