require 'rails_helper'

RSpec.describe IncomeValue, type: :model do

  describe 'バリデーションのテスト' do
    subject {income_value.valid?}

    let!(:income_value) { FactoryBot.build(:income_value) }

    context '各カラム' do
      it 'user_idカラムが空でないこと' do
        income_value.user = nil
        is_expected.to eq false
      end
        
      it 'income_idカラムが空欄でないこと' do
        income_value.income = nil
        is_expected.to eq false
      end

      it 'start_timeカラムが空欄でないこと' do
        income_value.start_time = ''
        is_expected.to eq false
      end

      it 'codeカラムが空欄でないこと' do
        income_value.code = ''
        is_expected.to eq false
      end

      it 'valueカラムが数値であること' do
        expect(income_value.value).to be_an(Integer)
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1になっている' do
        expect(IncomeValue.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Variablecostモデルとの関係' do
      it 'N:1になっている' do
        expect(IncomeValue.reflect_on_association(:income).macro).to eq :belongs_to
      end
    end
  end
end
