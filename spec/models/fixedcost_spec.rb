require 'rails_helper'

RSpec.describe Fixedcost, type: :model do
  describe 'バリデーションのテスト' do
    subject {fixedcost.valid?}

    let(:user) { create(:user) }
    let!(:fixedcost) { build(:fixedcost, user_id: user.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        fixedcost.name = ''
        is_expected.to eq false
      end
    end
  end
end
