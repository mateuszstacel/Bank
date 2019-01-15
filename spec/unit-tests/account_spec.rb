require 'account'
describe Account do
  let(:transaction) { double :transaction, credit: true, debit: true, balance: 20 }
  let(:statement) { double :statement }
  subject(:account) { Account.new(transaction, statement) }

  describe '#top_up' do
    it 'calls top_up with the amount described' do
      date = Time.now.strftime('%d/%m/%Y')
      expect(transaction).to receive(:credit).with(20)
      expect(statement).to receive(:add).with(date, '', 20, 20)
      account.top_up(20)
    end
  end

  describe '#withdraw' do
    it 'calls withdraw with the amount described' do
      date = Time.now.strftime('%d/%m/%Y')
      expect(transaction).to receive(:balance).and_return(20)
      expect(transaction).to receive(:debit).with(20)
      expect(statement).to receive(:add).with(date, 20, '', 20)
      account.withdraw(20)
    end
  end

  describe '#statement' do
    it 'print statement' do
      expect(statement).to receive(:transactions_statement)
      account.statement
    end
  end
end
