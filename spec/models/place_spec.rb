require 'rails_helper'

describe 'placeモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context '名前が空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(title: '', content: '失敗テスト')
        expect(task).not_to be_valid
      end
    end
　　context 'Eメールが空の場合' do
      it 'バリデーションにひっかかる' do
        # ここに内容を記載する
      end
    end
    context '住所が空の場合' do
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