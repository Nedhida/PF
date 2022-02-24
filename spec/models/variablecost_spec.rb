require 'rails_helper'

RSpec.describe Variablecost, type: :model do
  describe 'バリデーションのテスト' do
    subject {variablecost.valid?}

    let(:variablecost) { FactoryBot.build(:variablecost) }

    context 'nameカラム' do
      it '空欄でないこと' do
        variablecost.name = ''
        is_expected.to eq false
      end
    end

    context 'userカラム' do
      it '空でないこと' do
        variablecost.user = nil
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1になっている' do
        expect(Variablecost.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'VariablecostValueモデルとの関係' do
      it '1:Nとなっている' do
        expect(Variablecost.reflect_on_association(:variablecost_values).macro).to eq :has_many
      end
    end
  end
end
