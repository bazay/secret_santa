RSpec.describe SecretSanta::Runner do
  subject(:described_instance) { described_class.new(file_path) }

  let(:file_path) { Bundler.root.join('spec', 'files', 'group1.csv') }

  describe '#users' do
    subject(:users) { described_instance.users }

    it { is_expected.to have(10).users }

    context 'when first item' do
      subject { users.first }

      it { is_expected.to be_a(SecretSanta::User) }
      it { expect(subject.name).to eql("Chris") }
      it { expect(subject.email).to eql("chris@example.com") }
    end
  end
end
