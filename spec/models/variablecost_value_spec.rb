require 'rails_helper'

RSpec.describe VariablecostValue, type: :model do
  describe 'バリデーションのテスト' do
    subject {variablecost_value.valid?}

    let(:variablecost_value) { FactoryBot.build(:variablecost_value) }

    context '各カラム' do
      it 'user_idカラムが空でないこと' do
        variablecost_value.user = nil
        is_expected.to eq false
      end

      it 'variablecost_idカラムが空欄でないこと' do
        variablecost_value.variablecost = nil
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

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1になっている' do
        expect(VariablecostValue.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Variablecostモデルとの関係' do
      it 'N:1になっている' do
        expect(VariablecostValue.reflect_on_association(:variablecost).macro).to eq :belongs_to
      end
    end
  end
end
