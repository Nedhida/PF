require 'rails_helper'

RSpec.describe Income, type: :model do
  describe 'バリデーションのテスト' do
    subject {income.valid?}

    let(:income) { FactoryBot.build(:income) }

    context 'nameカラム' do
      it '空欄でないこと' do
        income.name = ''
        is_expected.to eq false
      end
    end
    
    context 'userカラム' do
      it '空でないこと' do
        income.user = nil
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1になっている' do
        expect(Income.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'IncomeValueモデルとの関係' do
      it '1:Nとなっている' do
        expect(Income.reflect_on_association(:income_values).macro).to eq :has_many
      end
    end
  end
end
