require 'rails_helper'

#describe テストのグループ化
RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }             #subject テストコードをDRYにexpect(X).to eqのXを定義。is_expected.to eq Yに変更できる。

    let!(:other_user) { create(:user) } #let インスタンス変数
    let(:user) { build(:user) }         #DBアクセスが必要なときcreate。必要ないときはbuild

    context 'nameカラム' do             #context 条件を分けるときに使うことが多いdescribeとほぼ同じ
      it '空欄でないこと' do            #it テストをexampleという単位にまとめる
        user.name = ''                  # do end 内の期待値と実際の値を比較してパスすればexampleがパス
        is_expected.to eq false         #expect(X).to eq Yで期待すること XとYが等しくなることを期待する。今は期待値と実際の値がfalseであることを確認
      end
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

end
