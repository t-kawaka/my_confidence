require 'rails_helper'

describe 'Task', type: :system do
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
    expect(page).to have_content '本日のアクション'
  end

  context '各タスクの動作確認テスト' do
    scenario 'タスク一覧のテスト' do
      visit tasks_path
      expect(page).to have_content 'test_title1'
      expect(page).to have_content 'test_title2'
    end

    scenario 'タスク作成' do
      visit new_task_path
      fill_in '作成日時', with: Date.current
      fill_in 'アクション内容', with: 'test_title4'
      fill_in 'アクション詳細情報', with: 'test_description4'
      fill_in '本日学んだこと', with: 'Rspecテスト'
      fill_in '取り組み時間', with: 30
      select '途中', from: 'task[progress]'
      click_button '保存'
      expect(page).to have_content 'test_title4'
    end

    scenario "あなたの過去の取り組み" do
      visit list_tasks_path
      expect(page).to have_content 'test_title1'
      expect(page).to have_content 'test_title2'
    end

    scenario "タスクの詳細のテスト" do
      visit list_tasks_path
      click_link '詳細', match: :first
      expect(page).to have_content 'test_description1'
    end

    scenario "タスク編集のテスト" do
      visit list_tasks_path
      click_link '編集', match: :first
      fill_in "アクション内容", with: "test編集"
      click_button '保存'
      expect(page).to have_content 'アクション「test編集」を更新しました'
    end
  end

  context '入力検索の絞り込みテスト' do
    scenario 'アクション内容の部分表示するかの絞り込みテスト' do
      visit list_tasks_path
      fill_in 'アクション内容', with: 'tle1'
      click_button '検索する'
      expect(page).to have_content 'test_title1'
    end

    scenario 'アクション日の部分入力した場合の絞り込みテスト' do
      visit list_tasks_path
      fill_in 'アクション日', with: 'Date.current'
      click_button '検索する'
      expect(page).to have_content 'test_title1'
    end

    scenario '進捗状況入力した場合の絞り込みテスト' do
      visit list_tasks_path
      select '途中', from: 'q_progress_eq'
      click_button '検索する'
      expect(page).to have_content 'test_title2'
    end
  end
end
