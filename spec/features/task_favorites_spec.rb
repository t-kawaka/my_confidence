require 'rails_helper'

describe 'Task_favorites', type: :system do
  before do
    user = User.new(name: 'user1', email: 'test1@gmail.com', password: 'password', password_confirmation: 'password')
    user2 = User.new(name: 'user2', email: 'test2@gmail.com', password: 'password', password_confirmation: 'password')
    FactoryBot.create(:task, title: 'test_title1', description: 'test_description1', start_time: Date.current, require_time: 60, progress: '開始', user: user)
    FactoryBot.create(:task, title: 'test_title2', description: 'test_description2', start_time: Date.current-1, require_time: 60, progress: '途中', user: user)
    FactoryBot.create(:task, title: 'test_title3', description: 'test_description3', start_time: Date.current-2, require_time: 60, progress: '完了', user: user)
    FactoryBot.create(:task, title: 'test_title2-1', description: 'test_description2-1', start_time: Date.current-2, require_time: 60, progress: '開始', user: user2)
    FactoryBot.create(:task, title: 'test_title2-2', description: 'test_description2-2', start_time: Date.current-3, require_time: 60, progress: '開始', user: user2)

    visit new_user_session_path
    fill_in 'メールアドレス', with: 'test1@gmail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    expect(page).to have_content '自分のアクション'
  end

  context 'いいね！入力テスト' do
    scenario 'いいね！承認' do
      visit users_path
      click_link '公開中', match: :first
      click_link '詳細', match: :first
      click_link 'いいね！'
      expect(page).to have_content 'いいね解除'
    end

    scenario 'いいね！解除' do
      visit users_path
      click_link '公開中', match: :first
      click_link '詳細', match: :first
      click_link 'いいね！'
      visit users_path
      click_link '公開中', match: :first
      click_link '詳細', match: :first
      click_link 'いいね解除'
      expect(page).to have_content 'いいね！'
    end
  end
end
