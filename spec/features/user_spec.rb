require 'rails_helper'

  describe 'User', type: :system do
    context 'ユーザー登録テスト' do
      it 'ユーザー登録成功' do
        visit new_user_registration_path
        fill_in 'ユーザー名', with: 'test_1'
        fill_in 'メールアドレス', with: 'test_1@gmail.com'
        fill_in 'パスワード', with: 'password'
        fill_in '確認用パスワード', with: 'password'
        click_button 'サインアップ'
        expect(page).to have_content '自分のアクション'
      end

      it 'ユーザー登録失敗（ユーザー名未入力）' do
        visit new_user_registration_path
        fill_in 'ユーザー名', with: ''
        fill_in 'メールアドレス', with: 'test_1@gmail.com'
        fill_in 'パスワード', with: 'password'
        fill_in '確認用パスワード', with: 'password'
        click_button 'サインアップ'
        expect(page).to have_content 'ユーザー名を入力してください'
      end

      it 'ユーザー登録失敗（メールアドレス未入力）' do
        visit new_user_registration_path
        fill_in 'ユーザー名', with: 'test_1'
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: 'password'
        fill_in '確認用パスワード', with: 'password'
        click_button 'サインアップ'
        expect(page).to have_content 'メールアドレスを入力してください'
      end

      it 'ユーザー登録失敗（パスワード未入力）' do
        visit new_user_registration_path
        fill_in 'ユーザー名', with: 'test_1'
        fill_in 'メールアドレス', with: 'test_1@gmail.com'
        fill_in 'パスワード', with: ''
        fill_in '確認用パスワード', with: 'password'
        click_button 'サインアップ'
        expect(page).to have_content 'パスワードを入力してください'
      end

      it 'ユーザー登録失敗（確認用パスワードが違う）' do
        visit new_user_registration_path
        fill_in 'ユーザー名', with: 'test_1'
        fill_in 'メールアドレス', with: 'test_1@gmail.com'
        fill_in 'パスワード', with: 'password'
        fill_in '確認用パスワード', with: 'passwordpassword'
        click_button 'サインアップ'
        expect(page).to have_content '確認用パスワードとパスワードの入力が一致しません'
      end
    end

    context 'ログインテスト' do
      before do
        FactoryBot.create(:user)
      end

      it 'ログイン成功' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test1@gmail.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content '自分のアクション'
      end

      it 'ログイン失敗（メールアドレス違う）' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test2@gmail.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'ログイン'
      end

      it 'ログイン失敗（パスワード違う）' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test1@gmail.com'
        fill_in 'パスワード', with: 'passwordpassword'
        click_button 'ログイン'
        expect(page).to have_content 'ログイン'
      end

      it 'ログアウト成功' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test1@gmail.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        click_on 'ログアウト'
        expect(page).to have_content 'ログイン'
      end

      it 'プロフィール画面変更' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test1@gmail.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        visit edit_user_registration_path
        fill_in 'パスワード', with: 'password2'
        fill_in '確認用パスワード', with: 'password2'
        fill_in '現在のパスワード', with: 'password'
        click_button 'プロフィール更新'
        expect(page).to have_content 'アカウントが更新されました。'
      end
    end

    context '管理者権限サイトへ入れるかどうかのテスト（userはadmin:"true"）' do
      before do
        FactoryBot.create(:user)
      end

      it 'ログイン成功' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test1@gmail.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        visit '/admin'
        expect(page).to have_content 'サイト管理'
      end
    end
  end
