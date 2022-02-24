require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @favorite = FactoryBot.build(:favorite)
  end

  describe 'バリデーションのテスト' do
    subject { @favorite.valid? }

    context 'favoriteモデル' do
      it 'user_idとvariablecost_value_idがあること' do
        is_expected.to eq true
      end

      it 'variablecost_valueが空でないこと' do
        @favorite.variablecost_value = nil
        is_expected.to eq false
      end

      it 'userが空でないこと' do
        @favorite.user = nil
        is_expected.to eq false
      end
    end

    context '一意性' do
      before do
        @favorite = FactoryBot.create(:favorite)
        @user1 = FactoryBot.create(:favorite)
      end

      it 'user_idとvariablecost_value_idの組み合わせは一意でなければ保存できない' do
        favorite2 = FactoryBot.build(:favorite, user_id: @favorite.user_id, variablecost_value_id: @favorite.variablecost_value_id)
        expect(favorite2).not_to be_valid
      end

      it 'user_idが同じでもvariablecost_value_idが違うなら保存できる' do
        favorite2 = FactoryBot.build(:favorite, user_id: @favorite.user_id, variablecost_value_id: @user1.variablecost_value_id)
        expect(favorite2).to be_valid
      end

      it 'uer_idが違うならvariablecost_value_idが同じでも保存できる' do
        favorite2 = FactoryBot.build(:favorite, user_id: @user1.user_id, variablecost_value_id: @favorite.variablecost_value_id)
        expect(favorite2).to be_valid
      end
    end
  end
end
