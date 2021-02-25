require 'rails_helper'

describe 'ごみ拾いブログ投稿機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:second_user) { FactoryBot.create(:second_user) }
  before do
    visit new_user_session_path
    fill_in "user[email]", with: "user_factory@example.com"
    fill_in "user[password]", with: "factory"
    click_on "ログイン"
  end   
  describe '新規作成機能' do
    before do
    click_on "ブログ投稿一覧"
    click_on "新しく記録を投稿する"
    fill_in "blog[title]", with: "test title"
    fill_in "blog[content]", with: "test content"
    click_on "登録"
    click_on "みんなにシェア"
    end
    context 'ユーザーが新規投稿した場合' do
      it '作成したブログが一覧画面に表示される' do
        visit blogs_path
        expect(page).to have_content "test title" && "test content"
      end
    end
    context 'ユーザーが新規投稿した場合' do
      it '作成したブログがブログ詳細画面に表示される' do
        visit blogs_path
        click_on "詳細"
        expect(page).to have_content "test title" && "test content"
      end
    end
  end

  describe '一覧表示機能' do
    before do
      FactoryBot.create(:blog, title: "１番目のブログタイトル", user_id: user.id)
      FactoryBot.create(:second_blog, title: "２番目のブログタイトル", user_id: user.id)
    end
    context 'ユーザーが新規投稿した場合' do
      it 'ブログ一覧画面にブログが作成日時が新しい順に表示される' do
        visit blogs_path
        actual_blog_title = all('.card-title').map(&:text)
        expected_blog_title = Blog.all.order(created_at: :desc).pluck(:title)
        expect(actual_blog_title).to eq expected_blog_title
      end
    end
  end

    describe 'いいね機能' do
      before do
        FactoryBot.create(:blog, title: "１番目のブログタイトル", user_id: user.id)
        FactoryBot.create(:second_blog, title: "２番目のブログタイトル", user_id: user.id)
        click_on "ログアウト"
        fill_in "user[email]", with: "user_factory2@example.com"
        fill_in "user[password]", with: "factory"
        click_on "ログイン"
        visit blogs_path
        click_on "詳細", match: :first
        first(:css, ".like_btn").click
      end  
      context 'ユーザーが他のユーザーにいいねした場合' do
        it '該当ブログのいいねカウントが１つ増える' do
          actual_like_count = Blog.last.favorites.count
          expect(actual_like_count).to eq 1
      end
    end
      context 'ユーザーがいいねを取り消した場合' do
        it 'ブログ一覧画面にて該当ブログのいいねカウントが１つ減る' do
          visit blogs_path
          click_on "詳細", match: :first
          first(:css, ".unlike_btn").click
          actual_like_count = Blog.last.favorites.count
          expect(actual_like_count).to eq 0
      end
    end
  end

  describe 'コメント機能' do
    before do
      FactoryBot.create(:blog, title: "１番目のブログタイトル", user_id: user.id)
      FactoryBot.create(:second_blog, title: "２番目のブログタイトル", user_id: user.id)
      click_on "ログアウト"
      fill_in "user[email]", with: "user_factory2@example.com"
      fill_in "user[password]", with: "factory"
      click_on "ログイン"
      visit blogs_path
      click_on "詳細", match: :first
    end  
    context 'ユーザーがブログにコメントした場合' do
      before do
        fill_in "comment[content]", with: "コメントしました"
        click_on "登録する"
      end
      it 'そのコメントとコメントしたユーザー名がブログ詳細に表示される' do
        expect(page).to have_content "User_factory2" && "コメントしました"
      end
    end
    context 'ユーザーがコメントを削除した場合' do
      it 'そのコメントが削除される' do
        fill_in "comment[content]", with: "コメントしました"
        click_on "登録する"
        click_on "コメント削除"
        sleep(3)
        page.driver.browser.switch_to.alert.accept
        expect(page).not_to have_content "User_factory2" && "コメントしました"
      end
    end
    context 'ユーザーがコメントを編集した場合' do
      it 'そのコメントが編集される' do
        fill_in "comment[content]", with: "コメントしました"
        click_on "登録する"
        click_on "コメント編集"
        sleep(3)
        fill_in "comment[content]", with: "コメント編集されました", match: :first
        click_on "更新する"
        expect(page).to have_content "コメント編集されました"
      end
    end
  end
end