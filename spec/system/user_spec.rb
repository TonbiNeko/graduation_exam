require 'rails_helper'

RSpec.describe 'ユーザー管理機能', type: :system do

  describe 'ユーザー管理機能' do
    let!(:user) { FactoryBot.create(:user, name: "ログイン機能確認", email: "test@example.com") }
    before do
      visit new_user_session_path
      fill_in "user[email]", with: "test@example.com"
      fill_in "user[password]", with: "factory"
      click_on "ログイン"
    end
    context 'ユーザーがログインした場合' do
      it "ユーザー詳細ページにいく" do
        expect(page).to have_content "ログイン機能確認" && "test@example.com"
      end
    end
    context 'ユーザーがプロフィール編集した場合' do
      it "ユーザー詳細画面のユーザー情報が変更される" do
        click_on "アカウント情報の編集"
        fill_in "user[name]", with: "編集済"
        fill_in "user[current_password]", with: "factory"
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

  describe 'ユーザー管理機能' do
    context 'ユーザーが新規登録した場合' do
      it "ユーザー情報が登録される" do
        visit new_user_registration_path
        fill_in "user[name]", with: "new_user"
        fill_in "user[email]", with: "new_user@example.com"
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        click_on "登録"
        expect(page).to have_content "new_user" && "アカウント登録が完了しました。"
      end
    end
  end
end