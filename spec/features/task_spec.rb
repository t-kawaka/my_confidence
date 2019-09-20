require 'rails_helper'

  describe 'Task', type: :system do
    context "本日のアクションを投稿" do
      before do
        FactoryBot.create(:user)
      end

      it "アクション投稿成功" do
        visit new_user_session_path
        fill_in "メールアドレス", with: "test1@gmail.com"
        fill_in "パスワード", with: "password"
        click_button 'ログイン'

        visit new_task_path
        fill_in "作成日時", with: Date.current
        fill_in "アクション内容", with: "テスト内容"
        fill_in "アクション詳細情報", with: "テスト詳細情報"
        fill_in "本日学んだこと", with: "Rspecテスト"
        fill_in "取り組み時間", with: 30
        select "開始", from: 'task[progress]'
        click_button '保存'
        expect(page).to have_content 'アクション「テスト内容」を作成しました'
      end
    end
  end
