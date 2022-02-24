require 'rails_helper'

RSpec.describe VariablecostValue, type: :model do
  describe 'バリデーションのテスト' do
    subject {variablecost_value.valid?}

    let(:user) { create(:user) }
    let(:variablecost) { build(:variablecost, user_id: user.id) }
    let!(:variablecost_value) { build(:variablecost_value, user_id: user.id, variablecost_id: variablecost.id) }

    context '各カラム' do
      it 'variablecost_idカラムが空欄でないこと' do
        variablecost_value.variablecost_id = ''
        is_expected.to eq false
      end
      
      it 'start_timeカラムが空欄でないこと' do
        variablecost_value.start_time = ''
        is_expected.to eq false
      end
      
      it 'codeカラムが空欄でないこと' do
        variablecost_value.code = ''
        is_expected.to eq false
      end
      
      it 'privacyカラムが空欄でないこと' do
        variablecost_value.privacy = ''
        is_expected.to eq false
      end
      
      it 'valueカラムが数値であること' do
        expect(variablecost_value.value).to be_an(Integer)
      end
    end
  end
end
