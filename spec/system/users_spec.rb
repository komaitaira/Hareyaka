require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'ユーザー認証のテスト' do
    describe 'ユーザー新規登録' do
      # before do
      #   visit new_user_registration_path
      # end
      # context '新規登録画面に遷移' do
      #   it '新規登録に成功する' do
      #     fill_in 'user[last_name]', with: "田中"
      #     fill_in 'user[first_name]', with: "太郎"
      #     fill_in 'user[kana_last_name]', with: "タナカ"
      #     fill_in 'user[kana_first_name]', with: "タロウ"
      #     fill_in 'user[email]', with: "tanaka@example.com"
      #     fill_in 'user[postal_code]', with: "1234567"
      #     fill_in 'user[address]', with: "東京都千代田区123-12-1"
      #     fill_in 'user[phone_number]', with: "12345678910"
      #     fill_in 'user[password]', with: "tanakataro"
      #     fill_in 'user[password_confirmation]', with: "tanakataro"
      #     click_button '新規登録'

      #     expect(page).to have_content 'アカウント登録が完了しました。'
      #   end
      #   it '新規登録に失敗する' do
      #     fill_in 'user[last_name]', with: ""
      #     fill_in 'user[first_name]', with: ""
      #     fill_in 'user[kana_last_name]', with: ""
      #     fill_in 'user[kana_first_name]', with: ""
      #     fill_in 'user[email]', with: ""
      #     fill_in 'user[postal_code]', with: ""
      #     fill_in 'user[address]', with: ""
      #     fill_in 'user[phone_number]', with: ""
      #     fill_in 'user[password]', with: ""
      #     fill_in 'user[password_confirmation]', with: ""
      #     click_button '新規登録'

      #     expect(page).to have_content 'error'
      #   end
      # end
    end
  end

end