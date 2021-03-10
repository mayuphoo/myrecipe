require 'rails_helper'

RSpec.describe Post, type: :post do
  describe '記事の投稿' do
    before do
      @post = FactoryBot.build(:post)
    end

    context '記事の投稿が上手く行く時' do
      it '全ての項目が存在すれば、登録できる' do
        expect(@post).to be_valid
      end
    end

    context '記事の投稿が上手くいかない時' do
      it '画像が1枚添付されていないと投稿できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end
      it 'タイトルが空では投稿できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it '記事の説明が無いと投稿できない' do
        @post.body = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Body can't be blank")
      end
      it 'カテゴリーの情報が無いと投稿できない' do
        @post.category_id = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('Category is not a number')
      end
    end
  end
end
