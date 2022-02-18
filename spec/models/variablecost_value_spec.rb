require 'rails_helper'

RSpec.describe VariablecostValue, type: :model do
  describe 'バリデーションのテスト' do
    subject {variablecost_value.valid?}

    let(:user) { create(:user) }
    let(:variablecost) { build(:variablecost, user_id: user.id) }
    let!(:variablecost_value) { build(:variablecost_value, user_id: user.id, variablecost_id: variablecost.id) }

    context '項目(variablecost_id)カラム' do
      it '空欄でないこと' do
        variablecost_value.variablecost_id = ''
        is_expected.to eq false
      end
    end
  end
end
