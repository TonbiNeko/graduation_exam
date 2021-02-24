require 'rails_helper'

RSpec.describe 'place管理機能', type: :system do

  describe '検索機能' do
    let!(:place) { FactoryBot.create(:place, name: "factory coffee shop", address: "東京都渋谷") }
    let!(:second_place) { FactoryBot.create(:second_place, name: "factory ice cream shop", address: "東京都恵比寿") }
    let!(:rule) { FactoryBot.create(:rule) }
    let!(:second_rule) { FactoryBot.create(:second_rule) }
    before do
      visit new_place_session_path
      fill_in "place[email]", with: "place_factory@example.com"
      fill_in "place[password]", with: "factory"
      click_on "ログイン"
      visit places_path
    end
    context '住所であいまい検索をした場合' do
      it "検索キーワードを含むplaceで絞り込まれる" do
        fill_in "q[address_cont]", with: "東京"
        click_on "検索"
        expect(page).to have_content "factory coffee shop" && "factory ice cream"
      end
    end
    context '住所で検索をした場合' do
      it "検索キーワードと完全一致するplaceが絞り込まれる" do
        fill_in "q[address_cont]", with: "東京都渋谷"
        click_on "検索"
        expect(page).to have_content "factory coffee shop"
      end
    end
    context '店名のあいまい検索をした場合' do
      it "検索キーワードを含むplaceで絞り込まれる" do
        fill_in "q[name_cont]", with: "shop"
        click_on "検索"
        expect(page).to have_content "factory coffee shop" && "factory ice cream shop"
      end
    end
    context '店名検索をした場合' do
      it "検索キーワードと完全一致するplaceが絞り込まれる" do
        fill_in "q[name_cont]", with: "factory coffee shop"
        click_on "検索"
        expect(page).not_to have_content "factory ice cream shop"
      end
    end
    context '住所と店名であいまい検索をした場合' do
      it "検索キーワードを含むplaceが絞り込まれる" do
        fill_in "q[address_cont]", with: "渋谷"
        fill_in "q[name_cont]", with: "shop"
        click_on "検索"
        expect(page).to have_content "factory coffee shop"
      end
    end
    context '住所と店名で検索をした場合' do
      it "検索キーワードと完全一致するplaceが絞り込まれる" do
        fill_in "q[address_cont]", with: "東京都渋谷"
        fill_in "q[name_cont]", with: "factory coffee shop"
        click_on "検索"
        expect(page).to have_content "factory coffee shop"
      end
    end
  end

  describe 'place管理機能' do
    let!(:place) { FactoryBot.create(:place, name: "ログイン機能確認", email: "test@example.com") }
    let!(:rule) { FactoryBot.create(:rule) }
    before do
      visit new_place_session_path
      fill_in "place[email]", with: "test@example.com"
      fill_in "place[password]", with: "factory"
      click_on "ログイン"
    end
    context 'placeがログインした場合' do
      it "place詳細ページにいく" do
        expect(page).to have_content "ログイン機能確認" && "test@example.com"
      end
    end
    context 'placeがプロフィール編集した場合' do
      it "place詳細画面のユーザー情報が変更される" do
        click_on "アカウント情報の編集"
        fill_in "place[name]", with: "編集済"
        fill_in "place[current_password]", with: "factory"
        click_on "更新"
        expect(page).to have_content "編集済"
      end
    end
    context 'ユーザーがアカウントを削除した場合' do
      it "アカウント情報が削除される" do
        click_on "アカウント情報の編集"
        click_on "アカウント削除"
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "アカウントを削除しました。またのご利用をお待ちしております。"
      end
    end
  end

  describe 'place管理機能' do
    context 'placeが新規登録した場合' do
      it "place情報が登録される" do
        visit new_place_registration_path
        fill_in "place[name]", with: "new_place"
        fill_in "place[email]", with: "new_place@example.com"
        fill_in "place[address]", with: "北海道"
        fill_in "place[description]", with: "coffee shop"
        fill_in "place[password]", with: "password"
        fill_in "place[password_confirmation]", with: "password"
        click_on "登録"
        expect(page).to have_content "new_place" && "coffee shop" && "アカウント登録が完了しました。"
      end
    end
  end
end