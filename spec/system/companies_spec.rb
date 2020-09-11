require 'rails_helper'

RSpec.describe "Companies", type: :system do
  let!(:admin){FactoryBot.create(:admin)}
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
          expect(page).to have_content "法人会員 は保存されませんでした。"
        end
      end
    end
  end

  describe '法人がログイン可能になるまでのテスト' do
    before do
      # 法人が登録申請フォーム入力
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

    describe '通知の確認〜申請承認' do
      it '申請してきた法人名が表示される' do
        visit admin_notifications_path
        expect(page).to have_content("テスト株式会社 様からの法人登録申請があります")
      end

      it 'リンクから企業詳細ページへ遷移できる' do
        visit admin_notifications_path
        notification = Notification.find_by({receiver_id: admin.id, receiver_class: "admin", sender_id: Company.last.id, sender_class: "company"})
        find("#request_message").click # ページに同一の文言のリンクがある場合（今回の場合「法人登録申請」）、idを指定してあげる
        expect(current_path).to eq('/admin/companies/' + notification.sender_id.to_s)
      end

      it '編集画面へ遷移する' do
        visit edit_admin_company_path(Company.last.id)
        expect(current_path).to eq('/admin/companies/' + Company.last.id.to_s + '/edit')
      end

      it '申請ステータスを承認済にする' do
        visit edit_admin_company_path(Company.last.id)
        choose "company_approved_true" # 申請ステータスを承認済にチェック（company_approved_trueはラジオボタン要素のid）
        click_button '変更を保存する'
        expect(page).to have_content '企業情報の更新が完了しました。'
        expect(current_path).to eq('/admin/companies/' + Company.last.id.to_s)
        click_on 'ログアウト'
      end
    end
  end

    # describe '法人ログイン' do
    #   let(:company) { Company.last }
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




      # context '表示の確認' do
      #   visit edit_admin_company_path(Company.last.id)
      #   it '登録情報編集と表示される' do
      #     expect(page).to have_content('登録情報編集')
      #   end
      #   it 'プロフィール画像編集フォームが表示される' do
      #     expect(page).to have_field 'company[profile_image]'
      #   end
      #   it 'ヘッダー画像編集フォームが表示される' do
      #     expect(page).to have_field 'company[background_image]'
      #   end
      #   it '企業名編集フォームに企業名が表示される' do
      #     expect(page).to have_field 'company[company_name]', with: Company.last.last_name
      #   end
      #   it 'フリガナ編集フォームに自分の企業カナ名が表示される' do
      #     expect(page).to have_field 'company[kana_company_name]', with: Company.last.kana_last_name
      #   end
      #   it 'メールアドレス編集フォームに自分のメールアドレスが表示される' do
      #     expect(page).to have_field 'company[email]', with: Company.last.email
      #   end
      #   it '郵便番号編集フォームに自分の郵便番号が表示される' do
      #     expect(page).to have_field 'company[postal_code]', with: Company.last.postal_code
      #   end
      #   it '住所編集フォームに自分の住所が表示される' do
      #     expect(page).to have_field 'company[address]', with: Company.last.address
      #   end
      #   it '電話番号編集フォームに自分の電話番号が表示される' do
      #     expect(page).to have_field 'company[phone_number]', with: Company.last.phone_number
      #   end
      #   it '自己紹介文編集フォームに自分の自己紹介文が表示される' do
      #     expect(page).to have_field 'company[introduction]', with: Company.last.introduction
      #   end
      #   # it '編集に成功する' do
      #   #   click_button '変更を保存する'
      #   #   expect(page).to have_content '会員情報の更新が完了しました。'
      #   #   expect(current_path).to eq('/users/' + user.id.to_s)
      #   # end
      #   # it '編集に失敗する' do
      #   #   fill_in 'user[last_name]', with: ''
      #   #   click_button '変更を保存する'
      #   #   expect(page).to have_content '件のエラーが発生したため ユーザ は保存されませんでした。'
      #   #   expect(current_path).to eq('/users/' + user.id.to_s)
      #   # end
      # end


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