RSpec.describe SecretSanta::User do
  subject(:described_instance) { described_class.new(name: name, email: email) }

  let(:name) { 'Chris' }
  let(:email) { 'chris@example.com' }

  describe '#==' do
    subject { described_instance == other_user }

    let(:other_user) { described_class.new(name: 'another', email: 'another@email.com') }

    it { is_expected.to be_falsey }

    context 'when emails match' do
      let(:other_user) { described_class.new(name: 'another', email: email) }

      it { is_expected.to be_truthy }
    end
  end
end
