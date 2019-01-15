require 'transactions'

 describe Transactions do

   date = Time.utc(2017, 10, 21)

   describe '#transactions_history' do
     it { is_expected.to respond_to :transactions_history}

     it 'expect transactions_history to be array' do
       expect(subject.transactions_history).to eq []
     end

     it 'expect transactions_history to be empty' do
       expect(subject.transactions_history).to be_empty
     end

     it 'expect transactions_history not to be empty' do
       past = Time.utc(2017, 10, 21)
       subject.add(date, 0, 30, 30)
       expect(subject.transactions_history).not_to be_empty
     end
   end

   describe '#add' do
     it { is_expected.to respond_to(:add).with(4).argument }

     it 'saves multiple transactions into the array' do
       past = Time.utc(2017, 10, 21)
       subject.add(3/2/2001, 0, 20, 20)
       subject.add(3/2/2001, 0, 30, 50)
       expect(subject.transactions_history.length).to eq 2
     end
   end

   describe '#transactions_statement' do
     it 'should print out statement' do
       date = Time.utc(2017, 10, 21)
       date = date.strftime("%d/%m/%Y")
       subject.add(date, 0, 20, 20)
       expect { subject.transactions_statement }.to output("Date || Credit || Debit || Balance\n21/10/2017 || 0 || 20 || 20 || \n").to_stdout
     end
   end
 end
