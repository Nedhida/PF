require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end


  describe '#create' do
    subject { @comment.valid? }

    context 'コメント投稿できる場合' do
      it 'コメント入力済みあれば投稿できる' do
        is_expected.to eq true
      end
    end

    context '投稿できない場合' do
      it 'コメントが空欄でないこと' do
        @comment.comment = ''
        is_expected.to eq false
      end
      it 'ユーザーの紐付けがあること' do
        @comment.user = nil
        is_expected.to eq false
      end
    end
  end
end
