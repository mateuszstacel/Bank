require 'statement'
describe Statement do
  subject(:statement) { Statement.new }

  describe '#transactions_history' do
    it { is_expected.to respond_to :statement }

    it 'expect transactions_history to be array' do
      expect(statement.transactions_statement).to eq []
    end

    it 'expect transactions_history to be empty' do
      expect(statement.transactions_statement).to be_empty
    end

    it 'expect transactions_history not to be empty' do
      date = Time.utc(2017, 10, 21)
      statement.add(date, 0, 30, 30)
      expect(statement.statement).not_to be_empty
    end
  end

  describe '#add' do
    it { is_expected.to respond_to(:add).with(4).argument }

    it 'saves multiple transactions into the array' do
      statement.add(3/2/2001, 0, 20, 20)
      statement.add(3/2/2001, 0, 30, 50)
      expect(statement.statement.length).to eq 2
    end
  end

  describe '#transactions_statement' do
    it 'should print out statement' do
      date = Time.utc(2017, 10, 21)
      date = date.strftime('%d/%m/%Y')
      statement.add(date, 0, 20, 20)
      expect { statement.transactions_statement }.to output("Date || Credit || Debit || Balance\n21/10/2017 || 0.00 || 20.00 || 20.00\n").to_stdout
    end
  end
end
