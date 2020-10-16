require 'rails_helper'

RSpec.describe "Companies", type: :system do
  let!(:admin){FactoryBot.create(:admin)}
  let(:company){FactoryBot.create(:company)}
  describe 'ユーザー認証のテスト' do
    describe '法人の新規登録申請' do
      before do
        visit new_company_registration_path
      end
      it '登録申請に成功する' do
        fill_in '企業名', with: "テスト2株式会社"
        fill_in 'フリガナ', with: "テストツーカブシキガイシャ"
        fill_in 'メールアドレス', with: "test2company@example.com"
        fill_in '郵便番号(ハイフンなし)', with: "2222222"
        fill_in '住所', with: "東京都千代田区222-22-2"
        fill_in '電話番号(ハイフンなし)', with: "22222222222"
        fill_in 'パスワード', with: "test2company"
        fill_in '確認用パスワード', with: "test2company"
        click_button '申請する'
        expect(page).to have_content '登録申請ありがとうございます。法人会員専用ページは運営にて申請が承認がされた後に閲覧可能になります。承認済メールが届くまで今しばらくお待ちください。'
      end
      it '登録申請に失敗する' do
        fill_in '企業名', with: ""
        fill_in 'フリガナ', with: ""
        fill_in 'メールアドレス', with: ""
        fill_in '郵便番号(ハイフンなし)', with: ""
        fill_in '住所', with: ""
        fill_in '電話番号(ハイフンなし)', with: ""
        fill_in 'パスワード', with: ""
        fill_in '確認用パスワード', with: ""
        click_button '申請する'
        expect(page).to have_content "法人会員 は保存されませんでした。"
      end
    end
  end

  describe '法人がログイン可能になるまでのテスト' do
    before do
      # 1.法人が登録申請フォーム入力
      visit new_company_registration_path
      fill_in '企業名', with: "テスト2株式会社"
      fill_in 'フリガナ', with: "テストツーカブシキガイシャ"
      fill_in 'メールアドレス', with: "test2company@example.com"
      fill_in '郵便番号(ハイフンなし)', with: "2222222"
      fill_in '住所', with: "東京都千代田区222-22-2"
      fill_in '電話番号(ハイフンなし)', with: "22222222222"
      fill_in 'パスワード', with: "test2company"
      fill_in '確認用パスワード', with: "test2company"
      click_button '申請する' # 通知が送信される
    end
    
    describe '管理者：通知の確認〜申請承認のテスト' do
      before do
        # 2.管理者でログイン
        visit new_admin_session_path
        fill_in 'メールアドレス', with: admin.email
        fill_in 'パスワード', with: admin.password
        click_button 'ログイン'
      end
      # 3.法人登録申請という文言があることから、管理者ログインができていることを確認
      it 'ヘッダーに法人登録申請と表示される' do
        expect(page).to have_content('法人登録申請')
      end
      # 4.法人登録申請のリンクをクリックし、申請企業名を確認
      it '法人登録申請一覧に申請してきた法人名が表示される' do
        visit admin_notifications_path
        expect(page).to have_content("テスト2株式会社 様からの法人登録申請があります")
      end
      # 5.登録情報編集ページへ
      it '編集画面へ遷移する' do
        visit admin_company_path(Company.last.id)
        click_link '編集する'
        expect(current_path).to eq edit_admin_company_path(Company.last.id)
      end
      # 6.ラジオボタンに注意
      it '申請ステータスを承認済にする' do
        visit edit_admin_company_path(Company.last.id)
        choose "company_approved_true" # 申請ステータスを承認済にチェック（company_approved_trueはラジオボタン要素のid）
        click_button '変更を保存する'
        expect(page).to have_content '企業情報の更新が完了しました。'
        expect(current_path).to eq admin_company_path(Company.last.id)
      end
    end

    describe '法人：ログインのテスト' do
      context '承認前の法人ログイン' do
        it 'ログインに失敗し、メール受信後に再度ログインするようメッセージが出る' do
          visit new_company_session_path
          fill_in 'メールアドレス', with: "test2company@example.com"
          fill_in 'パスワード', with: "test2company"
          click_button 'ログイン'
          expect(page).to have_content '登録申請が未承認です。申し訳ございませんが、承認済メールが届くまで今しばらくお待ちください。'
        end
      end

      context '承認後の法人ログイン' do
        before do
          login_as(admin) # 管理者ログイン
          visit edit_admin_company_path(Company.last.id)
          choose "company_approved_true" # 申請ステータスを承認済にチェック（company_approved_trueはラジオボタン要素のid）
          click_button '変更を保存する'
          click_on 'ログアウト'
          visit new_company_session_path
        end
        it 'ログインに成功する' do
          fill_in 'メールアドレス', with: "test2company@example.com"
          fill_in 'パスワード', with: "test2company"
          click_button 'ログイン'
          expect(page).to have_content 'ログインしました。'
        end
        it 'ログインに失敗する' do
          fill_in 'メールアドレス', with: ""
          fill_in 'パスワード', with: ""
          click_button 'ログイン'
          expect(current_path).to eq new_company_session_path
        end
      end
    end
  end
    
  describe '法人会員のテスト' do
    before do
      visit new_company_session_path
      fill_in 'メールアドレス', with: company.email
      fill_in 'パスワード', with: company.password
      click_button 'ログイン'
    end

    describe 'マイページのテスト' do
      it 'ヘッダーにマイページと表示される' do
        expect(page).to have_content('マイページ')
      end
      it 'マイページに遷移し編集リンクが表示される' do
        visit corporate_company_path(company)
        expect(page).to have_content('編集する')
      end
    end

    describe '編集のテスト' do
      before do
        visit edit_corporate_company_path(company)
      end
      context '編集画面へ遷移の確認' do
        it '遷移ができる' do
          expect(current_path).to eq edit_corporate_company_path(company)
        end
      end
      context '表示及び編集の確認' do
        it '登録情報編集と表示される' do
          expect(page).to have_content('登録情報編集')
        end
        it 'プロフィール画像編集フォームが表示される' do
          expect(page).to have_field 'company[profile_image]'
        end
        it 'ヘッダー画像編集フォームが表示される' do
          expect(page).to have_field 'company[background_image]'
        end
        it '企業名編集フォームに企業名が表示される' do
          expect(page).to have_field '企業名', with: company.company_name
        end
        it 'フリガナ編集フォームに自分の企業カナ名が表示される' do
          expect(page).to have_field 'フリガナ', with: company.kana_company_name
        end
        it 'メールアドレス編集フォームに自分のメールアドレスが表示される' do
          expect(page).to have_field 'メールアドレス', with: company.email
        end
        it '郵便番号編集フォームに自分の郵便番号が表示される' do
          expect(page).to have_field '郵便番号(ハイフンなし)', with: company.postal_code
        end
        it '住所編集フォームに自分の住所が表示される' do
          expect(page).to have_field '住所', with: company.address
        end
        it '電話番号編集フォームに自分の電話番号が表示される' do
          expect(page).to have_field '電話番号(ハイフンなし)', with: company.phone_number
        end
        it '自己紹介文編集フォームに自分の自己紹介文が表示される' do
          expect(page).to have_field '自己紹介文', with: company.introduction
        end
        it '編集に成功する' do
          fill_in '自己紹介文', with: "テスト株式会社のマイページへようこそ！"
          click_button '変更を保存する'
          expect(page).to have_content '企業情報の更新が完了しました。'
          expect(current_path).to eq corporate_company_path(company)
        end
        it '編集に失敗する' do
          fill_in '企業名', with: ""
          click_button '変更を保存する'
          expect(page).to have_content '件のエラーが発生したため 法人会員 は保存されませんでした。'
        end
      end
    end
  end
end