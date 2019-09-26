require 'rails_helper'

describe 'Comment', type: :system do
  before do
    user = User.new(name: "user1", email: 'test1@gmail.com', password: 'password', password_confirmation: 'password')
    user2 = User.new(name: "user2", email: 'test2@gmail.com', password: 'password', password_confirmation: 'password')
    FactoryBot.create(:task, title:"test_title1", description: "test_description1", start_time: Date.current, require_time: 60, progress: "開始", user: user)
    FactoryBot.create(:task, title:"test_title2", description: "test_description2", start_time: Date.current-1, require_time: 60, progress: "途中", user: user)
    FactoryBot.create(:task, title:"test_title3", description: "test_description3", start_time: Date.current-2, require_time: 60, progress: "完了", user: user)

    visit new_user_session_path
    fill_in "メールアドレス", with: "test1@gmail.com"
    fill_in "パスワード", with: "password"
    click_button 'ログイン'
    expect(page).to have_content '自分のアクション'
  end

  context 'コメント記述確認テスト' do
    scenario "タスクの詳細のテスト" do
      visit list_tasks_path
      click_link '詳細', match: :first
      fill_in "コメント入力画面", with: "ただいまコメントします"
      click_button '登録する'
      expect(page).to have_content 'ただいまコメントします'
    end
  end
end