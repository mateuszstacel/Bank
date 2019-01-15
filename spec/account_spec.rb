require 'account'
describe Account do

  describe '#balance' do
    it { is_expected.to respond_to :balance }

    it 'starting balance should be 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'account balance should be toped up by 100' do
      subject.top_up(100)
      expect(subject.balance).to eq 100
    end
  end

  describe '#withdraw' do
    it { is_expected.to respond_to(:withdraw).with(1).argument }

    it 'account balance should be change after withdraw by 50' do
      subject.top_up(100)
      subject.withdraw(50)
      expect(subject.balance).to eq 50
    end

    it "raise error when withdraw ammount it's bigger than account balance" do
      subject.top_up(100)
      expect { subject.withdraw(110) }.to raise_error 'Not enough funds!'
    end
  end
end
