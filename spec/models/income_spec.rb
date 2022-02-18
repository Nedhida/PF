require 'rails_helper'

RSpec.describe Income, type: :model do
  describe 'バリデーションのテスト' do
    subject {income.valid?}

    let(:user) { create(:user) }
    let!(:income) { build(:income, user_id: user.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        income.name = ''
        is_expected.to eq false
      end
    end
  end
end
