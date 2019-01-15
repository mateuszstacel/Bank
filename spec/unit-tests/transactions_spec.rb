require 'transactions.rb'

 describe Transactions do

   describe '#credit' do
     it 'changes balance by given number' do
       expect { subject.credit(100) }.to change { subject.balance }.from(0).to(100)
     end
   end

   describe '#debit' do
     it 'changes balance by given number' do
       expect { subject.debit(200) }.to change { subject.balance }.from(0).to(-200)
     end
   end
end
