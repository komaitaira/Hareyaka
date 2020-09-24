require 'rails_helper'

RSpec.describe "Rooms", type: :system do
  let(:user){FactoryBot.create(:user)}
  let!(:company){FactoryBot.create(:company)}

  describe 'DMのテスト' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      expect(page).to have_content 'ログインしました。'
    end

    context '表示の確認' do
      it '専門家一覧に遷移ができる' do
        click_on '専門家'
        expect(current_path).to eq('/companies')
      end
      it '企業詳細画面に遷移しDMを始めるボタンが表示される' do
        visit companies_path
        click_on 'テスト株式会社'
        expect(current_path).to eq('/companies/' + company.id.to_s)
        expect(page).to have_content 'テスト株式会社'
        expect(page).to have_button 'DMを始める'
      end
    end

    context '個人側：メッセージの送信' do
      before do
        visit company_path(company) # 企業の詳細画面へ移動
        click_on 'DMを始める'
      end
      it 'チャットルームに入ることができ、送信フォームが表示される' do
        expect expect(page).to have_field 'message[message]'
      end
      it 'メッセージを送信できる' do
        fill_in 'message[message]', with: 'テストメッセージ'
        click_button '送信'
        expect(page).to have_content 'テストメッセージ'
      end
      it 'メッセージ送信後、DM一覧画面に送信履歴が追加される' do
        fill_in 'message[message]', with: 'テストメッセージ'
        click_button '送信'
        expect(page).to have_content 'テストメッセージ' # チャットルーム内のメッセージ
        visit rooms_path
        expect(page).to have_content 'テストメッセージ' # DM一覧画面のメッセージ
        expect(page).to have_link 'メッセージを見る'
      end
    end

    context '法人側：メッセージの受信〜送信(返信)' do
      before do
        # 個人側でメッセージ送信
        visit company_path(company)
        click_on 'DMを始める'
        fill_in 'message[message]', with: 'テストメッセージ'
        click_button '送信'
        logout(user)
        # 法人ログイン
        visit new_company_session_path
        fill_in 'company[email]', with: company.email
        fill_in 'company[password]', with: company.password
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
      end

      it 'ヘッダーに通知数が表示される' do
        expect(page).to have_content '1 通知'
      end
      it 'リンクから通知一覧画面に遷移でき、個人ユーザーからのメッセージの受信が確認できる' do
        click_on '通知'
        expect(page).to have_content '通知'
        expect(page).to have_content 'テスト 太郎さんからのメッセージがあります'
      end
      it 'リンクからチャットルームに入ることができ、受け取ったメッセージが表示される' do
        click_on '通知'
        click_on 'メッセージ'
        expect expect(page).to have_content 'テストメッセージ'
      end
      it 'メッセージを送信できる' do
        click_on '通知'
        click_on 'メッセージ'
        fill_in 'message[message]', with: 'テストメッセージへの返信'
        click_button '送信'
        expect(page).to have_content 'テストメッセージへの返信'
      end
    end
  end
end
