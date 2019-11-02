require 'rails_helper'

describe 'Conversation', type: :system do
  before do
    user = User.new(name: 'user1', email: 'test1@gmail.com', password: 'password')
    user2 = User.new(name: 'user2', email: 'test2@gmail.com', password: 'password')
    FactoryBot.create(:task, title: 'test_title1', description: 'test_description1', start_time: Date.current, require_time: 60, progress: '開始', user: user)
    FactoryBot.create(:task, title: 'test_title2', description: 'test_description2', start_time: Date.current-1, require_time: 60, progress: '途中', user: user2)
    FactoryBot.create(:task, title: 'test_title3', description: 'test_description3', start_time: Date.current-2, require_time: 60, progress: '完了', user: user2)

    visit new_user_session_path
    fill_in 'メールアドレス', with: 'test1@gmail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    expect(page).to have_content '本日のアクション'
  end

  context 'メッセージ一覧 表示テスト' do
    scenario 'メッセージ入力成功' do
      visit users_path
      click_link "メッセージ", match: :first
      fill_in 'メッセージを入力', with: 'はじめまして'
      click_button 'メッセージを送る'
      visit conversations_path
      expect(page).to have_content('user2')
    end
  end
end
