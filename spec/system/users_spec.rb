require 'rails_helper'

RSpec.describe 'User', type: :system do
  let!(:user){FactoryBot.create(:user)}
  describe 'ユーザー認証のテスト' do
    describe 'ユーザー新規登録' do
      before do
        visit new_user_registration_path
      end
      context '新規登録画面に遷移' do
        it '新規登録に成功する' do
          fill_in '名前(姓)', with: "テスト"
          fill_in '名前(名)', with: "二郎"
          fill_in 'フリガナ(セイ)', with: "テスト"
          fill_in 'フリガナ(メイ)', with: "ジロウ"
          fill_in 'メールアドレス', with: "testjiro@example.com"
          fill_in '郵便番号(ハイフンなし)', with: "2222222"
          fill_in '住所', with: "東京都足立区123-12-1"
          fill_in '電話番号(ハイフンなし)', with: "22222222222"
          fill_in 'パスワード', with: "testjiro"
          fill_in '確認用パスワード', with: "testjiro"
          click_button '新規登録'
          expect(page).to have_content 'アカウント登録が完了しました。'
        end
        
        it '新規登録に失敗する' do
          fill_in '名前(姓)', with: ""
          fill_in '名前(名)', with: ""
          fill_in 'フリガナ(セイ)', with: ""
          fill_in 'フリガナ(メイ)', with: ""
          fill_in 'メールアドレス', with: ""
          fill_in '郵便番号(ハイフンなし)', with: ""
          fill_in '住所', with: ""
          fill_in '電話番号(ハイフンなし)', with: ""
          fill_in 'パスワード', with: ""
          fill_in '確認用パスワード', with: ""
          click_button '新規登録'
          expect(page).to have_content '個人会員 は保存されませんでした。'
        end
      end
    end
    
    describe 'ユーザーログイン' do
      before do
        visit new_user_session_path
      end

      context 'ログイン画面に遷移' do
        it 'ログインに成功する' do
          fill_in "メールアドレス", with: "test@example.com"
          fill_in 'パスワード', with: "testtaro"
          click_button 'ログイン'
          expect(page).to have_content 'ログインしました。'
        end

        it 'ログインに失敗する' do
          fill_in 'メールアドレス', with: ''
          fill_in 'パスワード', with: ''
          click_button 'ログイン'
          expect(current_path).to eq(new_user_session_path)
        end
      end
    end
  end

  describe 'ユーザーのテスト' do
    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: user.password
      click_button 'ログイン'
    end

    describe 'マイページのテスト' do
      it 'ヘッダーにマイページと表示される' do
        expect(page).to have_content('マイページ')
      end
      it 'マイページに遷移し編集リンクが表示される' do
        visit user_path(user)
        expect(page).to have_content('編集する')
      end
    end

    describe '編集のテスト' do
      context '編集画面へ遷移' do
        it '遷移ができる' do
          visit edit_user_path(user)
          expect(current_path).to eq('/users/' + user.id.to_s + '/edit')
        end
      end

      context '表示の確認と編集' do
        before do
          visit edit_user_path(user)
        end
        it '登録情報編集と表示される' do
          expect(page).to have_content('登録情報編集')
        end
        it '画像編集フォームが表示される' do
          expect(page).to have_field 'user[profile_image]'
        end
        it '名前編集フォームに自分の姓が表示される' do
          expect(page).to have_field '名前(姓)', with: user.last_name
        end
        it '名前編集フォームに自分の名が表示される' do
          expect(page).to have_field '名前(名)', with: user.first_name
        end
        it '名前編集フォームに自分のカナ姓が表示される' do
          expect(page).to have_field 'フリガナ(セイ)', with: user.kana_last_name
        end
        it '名前編集フォームに自分のカナ名が表示される' do
          expect(page).to have_field 'フリガナ(メイ)', with: user.kana_first_name
        end
        it 'メールアドレス編集フォームに自分のメールアドレスが表示される' do
          expect(page).to have_field 'メールアドレス', with: user.email
        end
        it '郵便番号編集フォームに自分の郵便番号が表示される' do
          expect(page).to have_field '郵便番号(ハイフンなし)', with: user.postal_code
        end
        it '住所編集フォームに自分の住所が表示される' do
          expect(page).to have_field '住所', with: user.address
        end
        it '電話番号編集フォームに自分の電話番号が表示される' do
          expect(page).to have_field '電話番号(ハイフンなし)', with: user.phone_number
        end
        it '自己紹介文編集フォームに自分の自己紹介文が表示される' do
          expect(page).to have_field '自己紹介文', with: user.introduction
        end
        it '編集に成功する' do
          # 名前を三郎に変更
          fill_in 'user[first_name]', with: '三郎'
          fill_in 'フリガナ(メイ)', with: 'サブロウ'
          click_button '変更を保存する'
          expect(page).to have_content '会員情報の更新が完了しました。'
          expect(page).to have_content 'テスト 三郎 (テスト サブロウ)'
          expect(current_path).to eq('/users/' + user.id.to_s)
        end
        it '編集に失敗する' do
          # first_name 名前(名)を空欄で入力
          fill_in 'user[first_name]', with: ''
          click_button '変更を保存する'
          expect(page).to have_content '件のエラーが発生したため 個人会員 は保存されませんでした。'
          expect(page).to have_content '名前(名)を入力してください'
          expect(current_path).to eq('/users/' + user.id.to_s)
        end
      end
    end
  end
  
end