require 'rails_helper'

  describe 'Point', type: :system do
    context "現在、重点的に取り組んでいること" do
      before do
        FactoryBot.create(:user)
      end

      it "「重点的に取り組んでいること」を登録" do
        visit new_user_session_path
        fill_in "メールアドレス", with: "test1@gmail.com"
        fill_in "パスワード", with: "password"
        click_button 'ログイン'

        visit new_point_path
        fill_in "最近重点的に取り組んでいる内容", with: "成果物作成する"
        click_button '保存'
        expect(page).to have_content '重点的に取り組んでいること「成果物作成する」を作成しました'
      end

      it "「重点的に取り組んでいること」のタイトルを入力していない場合" do
        visit new_user_session_path
        fill_in "メールアドレス", with: "test1@gmail.com"
        fill_in "パスワード", with: "password"
        click_button 'ログイン'

        visit new_point_path
        fill_in "最近重点的に取り組んでいる内容", with: nil
        click_button '保存'
        expect(page).to have_content '1件のエラーがあります。'
      end
    end
  end
