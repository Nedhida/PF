require 'rails_helper'

RSpec.describe Fixedcost, type: :model do
  describe 'バリデーションのテスト' do
    subject {fixedcost.valid?}

    let(:fixedcost) { FactoryBot.build(:fixedcost) }

    context 'nameカラム' do
      it '空欄でないこと' do
        fixedcost.name = ''
        is_expected.to eq false
      end
    end

    context 'userカラム' do
      it '空でないこと' do
        fixedcost.user = nil
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1になっている' do
        expect(Fixedcost.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'FixedcostValueモデルとの関係' do
      it '1:Nとなっている' do
        expect(Fixedcost.reflect_on_association(:fixedcost_values).macro).to eq :has_many
      end
    end
  end
end
