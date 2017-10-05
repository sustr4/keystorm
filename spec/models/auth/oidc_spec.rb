require 'rails_helper'

describe Auth::Oidc, type: :model do
  describe '#parse_hash_groups' do
    context 'with correct groups' do
      let(:env_hash) do
        { 'OIDC_EDU_PERSON_ENTITLEMENTS' \
           => File.read(File.join(MOCK_DIR, 'groups')) }
      end

      let(:groups) { Auth::Oidc.send(:parse_hash_groups, env_hash) }

      it 'returns not nil' do
        expect(groups).not_to be_nil
      end

      it 'returns 1 groups' do
        expect(groups.size).to eq(1)
      end
    end

    context 'with incorrect groups' do
      let(:env_hash) do
        { 'OIDC_EDU_PERSON_ENTITLEMENTS' \
          => File.read(File.join(MOCK_DIR, 'wrong_groups')) }
      end

      let(:groups) { Auth::Oidc.send(:parse_hash_groups, env_hash) }

      it 'returns not nil' do
        expect(groups).not_to be_nil
      end

      it 'returns 0 groups' do
        expect(groups.size).to eq(0)
      end
    end
  end
end
