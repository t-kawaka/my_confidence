require 'rails_helper'

describe 'Relationship', type: :system do
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
    expect(page).to have_content '自分のアクション'
  end

  context 'ユーザーフォローのテスト' do
    scenario 'ユーザーフォロー' do
      visit users_path
      click_button 'ユーザーフォロー', match: :first
      expect(page).to have_button('つながりを解除')
    end
  end

  context 'つながり解除のテスト' do
    scenario 'ユーザーフォロー' do
      visit users_path
      click_button 'ユーザーフォロー', match: :first
      expect(page).to have_button('つながりを解除')
      click_button 'つながりを解除', match: :first
      expect(page).to have_button('ユーザーフォロー')
    end
  end
end
