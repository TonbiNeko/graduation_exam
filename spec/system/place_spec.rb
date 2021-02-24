require 'rails_helper'

RSpec.describe 'place管理機能', type: :system do

  describe '検索機能' do
    let!(:task) { FactoryBot.create(:task, name: "task", status: "完了") }
    let!(:second_task) { FactoryBot.create(:second_task, name: "sample", status: "完了") }
    let!(:third_task) { FactoryBot.create(:third_task, name: "sample2", status: "完了") }
    before do
      visit tasks_path
      fill_in "session[email]", with: "factorybot1@example.com"
      fill_in "session[password]", with: "factorybot"
      click_on "Log in"
      visit tasks_path
    end
    context '住所であいまい検索をした場合' do
      it "検索キーワードを含むplaceで絞り込まれる" do
        fill_in "name", with: "task"
        click_on "検索", match: :first
        expect(page).to have_content 'task'
      end
    end
    context '住所で検索をした場合' do
      it "検索キーワードと完全一致するplaceが絞り込まれる" do
        select "完了", from: "status"
        find('#status').click
        expect(page).to have_content "task" && "完了"
      end
    end
    context '店名のあいまい検索をした場合' do
      it "検索キーワードを含むplaceで絞り込まれる" do
        fill_in "name", with: "sample"
        select "完了", from: "status"
        find('#status').click
        expect(page).to have_content "sample" && "sample2" && "完了"
      end
    end
    context '店名検索をした場合' do
      it "検索キーワードと完全一致するplaceが絞り込まれる" do
        fill_in "name", with: "sample"
        select "完了", from: "status"
        find('#status').click
        expect(page).to have_content "sample" && "sample2" && "完了"
      end
    end
    context '住所と店名であいまい検索をした場合' do
      it "検索キーワードを含むplaceで絞り込まれる" do
        fill_in "name", with: "sample"
        select "完了", from: "status"
        find('#status').click
        expect(page).to have_content "sample" && "sample2" && "完了"
      end
    end
    context '住所と店名で検索をした場合' do
      it "検索キーワードと完全一致するplaceが絞り込まれる" do
        fill_in "name", with: "sample"
        select "完了", from: "status"
        find('#status').click
        expect(page).to have_content "sample" && "sample2" && "完了"
      end
    end
  end
end