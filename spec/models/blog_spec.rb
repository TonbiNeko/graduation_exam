require 'rails_helper'

describe 'ブログモデル機能', type: :model do
  let!(:user) { FactoryBot.create(:user) }
  describe 'バリデーションのテスト' do
    context 'タイトルが空の場合' do
      it 'バリデーションにひっかる' do
        blog = Blog.new(title: '', content: '失敗テスト', user_id: User.first.id)
        expect(blog).not_to be_valid
      end
    end
    context 'タイトルが100文字以上空の場合' do
      it 'バリデーションにひっかかる' do
        blog = Blog.new(title: 'タイトル' * 100, content: '失敗テスト', user_id: User.first.id)
        expect(blog).not_to be_valid
      end
    end
    context 'コンテンツが空の場合' do
      it 'バリデーションにひっかかる' do
        blog = Blog.new(title: '失敗テスト', content: '', user_id: User.first.id)
        expect(blog).not_to be_valid
      end
    end
    context '内容が1000文字以上の場合' do
      it 'バリデーションにひっかかる' do
        blog = Blog.new(title: '失敗テスト', content: 'コンテンツ' * 1000, user_id: User.first.id)
        expect(blog).not_to be_valid
      end
    end
    context 'タイトルと内容が入力されていて、タイトル１文字以上１００文字以下、内容１文字以上１０００文字以下の時' do
      it 'バリデーションが通る' do
        blog = Blog.new(title: '成功テスト', content: 'コンテンツ', user_id: User.first.id)
        expect(blog).to be_valid
      end
    end
  end
end