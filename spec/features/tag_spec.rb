require 'rails_helper'

describe 'Tag', type: :system do
  before do
    user = User.new(name: 'user1', email: 'test1@gmail.com', password: 'password')
    FactoryBot.create(:task, title: 'test_title1', description: 'test_description1', start_time: Date.current, require_time: 60, progress: '開始', user: user)
    FactoryBot.create(:task, title: 'test_title2', description: 'test_description2', start_time: Date.current-1, require_time: 60, progress: '途中', user: user)
    FactoryBot.create(:task, title: 'test_title3', description: 'test_description3', start_time: Date.current-2, require_time: 60, progress: '完了', user: user)
    FactoryBot.create(:tag, name: 'プログラミング', user: user)

    visit new_user_session_path
    fill_in 'メールアドレス', with: 'test1@gmail.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    expect(page).to have_content '自分のアクション'
  end

  context 'タグを追加した場合のテスト' do
    scenario 'タスク作成' do
      visit new_task_path
      check 'task_tag_ids_1'
      fill_in '作成日時', with: Date.current
      fill_in 'アクション内容', with: 'test_title4'
      fill_in 'アクション詳細情報', with: 'test_description4'
      fill_in '本日学んだこと', with: 'Rspecテスト'
      fill_in '取り組み時間', with: 30
      select '途中', from: 'task[progress]'
      click_button '保存'
      expect(page).to have_content 'プログラミング'
    end
  end
end
