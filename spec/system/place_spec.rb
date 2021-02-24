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
end