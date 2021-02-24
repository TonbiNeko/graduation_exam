require 'rails_helper'

describe 'placeモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context '名前が空の場合' do
      it 'バリデーションにひっかる' do
        place = Place.new(name: '', email: 'test@example.com', address: "神奈川県横浜市", description: "test", password: "testtest", password_confirmation: "testtest")
        expect(place).not_to be_valid
      end
    end
    context 'Eメールが空の場合' do
      it 'バリデーションにひっかかる' do
        place = Place.new(name: 'test', email: '', address: "神奈川県横浜市", description: "test", password: "testtest", password_confirmation: "testtest")
        expect(place).not_to be_valid
      end
    end
    context '住所が空の場合' do
      it 'バリデーションにひっかかる' do
        place = Place.new(name: 'test', email: 'test@example.com', address: "", description: "test", password: "testtest", password_confirmation: "testtest")
        expect(place).not_to be_valid
      end
    end
    context '詳細が100文字以上の場合' do
      it 'バリデーションにひっかかる' do
        place = Place.new(name: 'test', email: 'test@example.com', address: "神奈川県横浜市", description: "test" * 100, password: "testtest", password_confirmation: "testtest")
        expect(place).not_to be_valid
      end
    end
    context '全て入力した場合' do
      it 'バリデーションが通る' do
        place = Place.new(name: 'test', email: 'test@example.com', address: "神奈川県横浜市", description: "test", password: "testtest", password_confirmation: "testtest")
        expect(place).to be_valid
      end
    end
  end
end