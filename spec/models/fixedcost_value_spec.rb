require 'rails_helper'

RSpec.describe FixedcostValue, type: :model do

    describe 'バリデーションのテスト' do
    subject {fixedcost_value.valid?}

    let(:fixedcost_value) { FactoryBot.build(:fixedcost_value) }

    context '各カラム' do
      it 'user_idカラム空でないこと' do
        fixedcost_value.user = nil
        is_expected.to eq false
      end
        
      it 'fixedcost_idカラムが空欄でないこと' do
        fixedcost_value.fixedcost = nil
        is_expected.to eq false
      end

      it 'start_timeカラムが空欄でないこと' do
        fixedcost_value.start_time = nil
        is_expected.to eq false
      end

      it 'codeカラムが空欄でないこと' do
        fixedcost_value.code = nil
        is_expected.to eq false
      end

      it 'valueカラムが数値であること' do
        expect(fixedcost_value.value).to be_an(Integer)
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1になっている' do
        expect(FixedcostValue.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Fixedcostモデルとの関係' do
      it 'N:1になっている' do
        expect(FixedcostValue.reflect_on_association(:fixedcost).macro).to eq :belongs_to
      end
    end
  end
end
