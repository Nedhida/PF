require 'rails_helper'

#describe テストのグループ化
RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }             #subject テストコードをDRYにexpect(X).to eqのXを定義。is_expected.to eq Yに変更できる。

    let!(:other_user) { FactoryBot.create(:user) } #let インスタンス変数
    let(:user) { FactoryBot.build(:user) }         #DBアクセスが必要なときcreate。必要ないときはbuild

    context 'nameカラム' do             #context 条件を分けるときに使うことが多いdescribeとほぼ同じ
      it '空欄でないこと' do            #it テストをexampleという単位にまとめる
        user.name = ''                  # do end 内の期待値と実際の値を比較してパスすればexampleがパス
        is_expected.to eq false         #expect(X).to eq Yで期待すること XとYが等しくなることを期待する。今は期待値と実際の値がfalseであることを確認
      end                               #eq マッチャの１つ　オブジェクトが一致しているか
      it '2文字以上であること: 1文字は×' do
        user.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '2文字以上であること: 2文字は〇' do
        user.name = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '20文字以下であること: 20文字は〇' do
        user.name = Faker::Lorem.characters(number: 20)
        is_expected.to eq true
      end
      it '20文字以下であること: 21文字は×' do
        user.name = Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
      it '一意性があること' do
        user.name = other_user.name
        is_expected.to eq false
      end
    end

  end
  
  describe 'アソシエーションのテスト' do
    context 'Variablecostモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:variablecosts).macro).to eq :has_many #reflect_on_association 引数として渡したモデルが持つAssociationReflectionを返す
      end                                                                         #AssociationReflectionにmacroメソッドをかけるとアソシエーションが返る
    end
    
    context 'VariablecostValueモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:variablecost_values).macro).to eq :has_many
      end
    end
    
    context 'Fixedcostモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:fixedcosts).macro).to eq :has_many
      end
    end
    
    context 'FixedcostValueモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:fixedcost_values).macro).to eq :has_many
      end
    end
    
    context 'Incomeモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:incomes).macro).to eq :has_many
      end
    end
    
    context 'IncomeValueモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:income_values).macro).to eq :has_many
      end
    end
    
  end

end
