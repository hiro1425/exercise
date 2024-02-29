require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '運動記録' do
    context '運動記録が投稿できる場合' do
      it 'タイトルとテキストとカテゴリーと場所と実施日があれば投稿できる' do
        expect(@post).to be_valid
      end
    end
    context '運動記録が投稿できない場合' do
      it 'タイトルが空では投稿できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'テキストが空では投稿できない' do
        @post.text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーが空では投稿できない' do
        @post.category_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include("Category can't be blank")
      end
      it '場所が空では投稿できない' do
        @post.place_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include("Place can't be blank")
      end
      it '実施日が空では投稿できない' do
        @post.execution_date = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Execution date can't be blank")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('User must exist')
      end
    end
  end
end
