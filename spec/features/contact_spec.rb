require 'rails_helper'

  describe 'Contact', type: :system do
    context 'お問い合わせ機能テスト' do
      before do
        FactoryBot.create(:user)
      end

      it 'お問い合わせを作成' do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'test1@gmail.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'

        visit new_contact_path
        fill_in 'タイトル', with: 'タイトルA'
        fill_in '内容', with: '内容A'
        click_button '確認画面にすすむ'

        click_button '送信する'
        expect(page).to have_content 'お問い合わせ「タイトルA」を作成しました'
      end
    end
  end
