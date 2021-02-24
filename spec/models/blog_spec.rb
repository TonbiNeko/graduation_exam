require 'rails_helper'

describe 'ブログモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'タイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(title: '', content: '失敗テスト')
        expect(task).not_to be_valid
      end
    end
　　context 'タイトルが100文字以上空の場合' do
      it 'バリデーションにひっかかる' do
        # ここに内容を記載する
      end
    end
    context 'コンテンツが空の場合' do
      it 'バリデーションにひっかかる' do
        # ここに内容を記載する
      end
    end
    context '詳細が100文字以上の場合' do
      it 'バリデーションにひっかかる' do
        # ここに内容を記載する
      end
    end
    context '詳細が空の場合' do
      it 'バリデーションが通る' do
        # ここに内容を記載する
      end
    end
  end
end