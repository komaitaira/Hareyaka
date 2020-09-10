require 'rails_helper'

RSpec.describe "Companies", type: :system do
  let!(:admin){FactoryBot.create(:admin)}
  #let!(:company){FactoryBot.create(:company)}
  describe 'ユーザー認証のテスト' do
    describe '法人の新規登録申請' do
      before do
        visit new_company_registration_path
      end
      context '新規登録申請画面に遷移' do
        it '登録申請に成功する' do
          fill_in 'company[company_name]', with: "テスト株式会社"
          fill_in 'company[kana_company_name]', with: "テストカブシキガイシャ"
          fill_in 'company[email]', with: "testcompany@example.com"
          fill_in 'company[postal_code]', with: "1234567"
          fill_in 'company[address]', with: "東京都千代田区123-12-1"
          fill_in 'company[phone_number]', with: "12345678910"
          fill_in 'company[password]', with: "testcompany"
          fill_in 'company[password_confirmation]', with: "testcompany"
          click_button '申請する'
          expect(page).to have_content '登録申請ありがとうございます。法人会員専用ページは運営にて申請が承認がされた後に閲覧可能になります。承認済メールが届くまで今しばらくお待ちください。'
        end
        
        it '登録申請に失敗する' do
          fill_in 'company[company_name]', with: ""
          fill_in 'company[kana_company_name]', with: ""
          fill_in 'company[email]', with: ""
          fill_in 'company[postal_code]', with: ""
          fill_in 'company[address]', with: ""
          fill_in 'company[phone_number]', with: ""
          fill_in 'company[password]', with: ""
          fill_in 'company[password_confirmation]', with: ""
          click_button '申請する'
          expect(page).to have_content "company は保存されませんでした。"
        end
      end
    end
  end

  describe '法人登録申請の通知のテスト' do
    before do
      # 登録申請フォーム入力
      visit new_company_registration_path
      fill_in 'company[company_name]', with: "テスト株式会社"
      fill_in 'company[kana_company_name]', with: "テストカブシキガイシャ"
      fill_in 'company[email]', with: "testcompany@example.com"
      fill_in 'company[postal_code]', with: "1234567"
      fill_in 'company[address]', with: "東京都千代田区123-12-1"
      fill_in 'company[phone_number]', with: "12345678910"
      fill_in 'company[password]', with: "testcompany"
      fill_in 'company[password_confirmation]', with: "testcompany"
      click_button '申請する'
      # 管理者でログイン
      visit new_admin_session_path
      fill_in 'admin[email]', with: admin.email
      fill_in 'admin[password]', with: admin.password
      click_button 'ログイン'
    end

    describe 'ヘッダーの表示' do
      it '法人登録申請と表示される' do
        expect(page).to have_content('法人登録申請')
      end
    end

    describe '通知のテスト' do
      it '申請してきた法人名が表示される' do
        visit admin_notifications_path
        expect(page).to have_content("テスト株式会社 様からの法人登録申請があります")
      end
    end
  end

    # context '登録申請がない場合' do
    #   it '新着通知はないことのメッセージが表示される' do
    #     expect(page).to have_content '現在、新しい登録申請はありません。'
    #   end
    # end

    # describe '法人ログイン' do
    #   before do
    #     visit new_company_session_path
    #   end

    #   context 'ログイン画面に遷移' do
    #     it 'ログインに成功する' do
    #       fill_in 'company[email]', with: company.email
    #       fill_in 'company[password]', with: company.password
    #       click_button 'ログイン'
    #       expect(page).to have_content 'ログインしました。'
    #     end

    #     it 'ログインに失敗する' do
    #       fill_in 'company[email]', with: ''
    #       fill_in 'company[password]', with: ''
    #       click_button 'ログイン'
    #       expect(current_path).to eq(new_company_session_path)
    #     end
    #   end
    # end

end
