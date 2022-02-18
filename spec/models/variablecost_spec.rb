require 'rails_helper'

RSpec.describe Variablecost, type: :model do
  describe 'バリデーションのテスト' do
    subject {variablecost.valid?}

    let(:user) { create(:user) }
    let!(:variablecost) { build(:variablecost, user_id: user.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        variablecost.name = ''
        is_expected.to eq false
      end
    end
  end
end
