require 'rails_helper'

RSpec.describe "Articles", type: :system do
  describe '記事のテスト' do
    let(:company){FactoryBot.create(:company)}
    let(:genre){FactoryBot.create(:genre)}
    let!(:article){FactoryBot.create(:article, company: company, genre: genre)}
    before do
      visit new_company_session_path
      fill_in 'メールアドレス', with: company.email
      fill_in 'パスワード', with: company.password
      click_button 'ログイン'
    end
    describe 'サイドバーのテスト' do
      context '表示の確認' do
        it '記事検索と表示される' do
          expect(page).to have_content "記事検索"
          expect(current_path).to eq corporate_articles_path
        end
        it '記事登録と表示される' do
          expect(page).to have_content "記事登録"
          expect(current_path).to eq corporate_articles_path
        end
      end
    end

    describe '投稿のテスト' do
      context '新規記事投稿ページへ遷移' do
        it '遷移する' do
          click_on '記事を登録する'
          expect(page).to have_content "新規記事投稿"
          expect(current_path).to eq new_corporate_article_path
        end
      end
      context '表示の確認' do
        before do
          visit new_corporate_article_path
        end
        it '記事トップ画像フォームが表示される' do
          expect(page).to have_field 'article[image]'
        end
        it 'ジャンルのセレクトボックスが表示される' do
          expect(page).to have_select 'ジャンル'
        end
        it '掲載ステータスのセレクトボックスが表示される' do
          expect(page).to have_select '掲載ステータス'
        end
        it '記事タイトルフォームが表示される' do
          expect(page).to have_field '記事タイトル'
        end
        it '記事内容フォームが表示される' do
          expect(page).to have_field '記事内容'
        end
        it '記事投稿ボタンが表示される' do
          expect(page).to have_button '記事を投稿する'
        end
      end
      context '記事の投稿' do
        before do
          visit new_corporate_article_path
        end
        it '投稿に成功する' do
          select "テストジャンル", from: 'ジャンル'
          select "掲載中", from: '掲載ステータス'
          fill_in '記事タイトル', with: "RSpecは難しい"
          fill_in '記事内容', with: "難しいけどテストスイートが通って全部緑になると嬉しい"
          click_button "記事を投稿する"
          expect(page).to have_content "記事を新規投稿しました。"
        end
        it '投稿に失敗する' do
          fill_in '記事タイトル', with: ""
          click_button "記事を投稿する"
          expect(page).to have_content "件のエラーが発生したため 記事 は保存されませんでした。"
        end
      end
    end
  
    describe '編集のテスト' do
      context '各画面への遷移の確認' do
        it '記事詳細画面への遷移ができる' do
          click_on article.title
          expect(page).to have_content "記事詳細"
          expect(current_path).to eq corporate_article_path(article)
        end
        it '記事編集画面への遷移ができる' do
          visit corporate_article_path(article) # 記事詳細画面への遷移
          click_on "編集する"
          expect(page).to have_content "記事情報編集"
          expect(current_path).to eq edit_corporate_article_path(article)
        end
      end
      context '表示及び編集の確認' do
        before do
          visit edit_corporate_article_path(article)
        end
        it '記事トップ画像フォームが表示される' do
          expect(page).to have_field 'article[image]'
        end
        it 'ジャンルのセレクトボックスが表示される' do
          expect(page).to have_select('ジャンル', selected: 'テストジャンル')
        end
        it '掲載ステータスのセレクトボックスが表示される' do
          expect(page).to have_select('掲載ステータス', selected: '掲載中')
        end
        it '記事タイトルフォームが表示される' do
          expect(page).to have_field '記事タイトル', with: article.title
        end
        it '記事内容フォームが表示される' do
          expect(page).to have_field '記事内容', with: article.body
        end
        it '記事編集ボタンが表示される' do
          expect(page).to have_button '変更を保存する'
        end
        it '編集に成功する' do
          select "掲載停止中"
          fill_in '記事タイトル', with: "RSpecをスラスラ書けるようになるまで掲載停止します"
          click_button '変更を保存する'
          expect(page).to have_content '記事情報の更新が完了しました。'
          expect(page).to have_content '【現在の掲載状況：掲載停止中】'
          expect(current_path).to eq corporate_article_path(article)
        end
        it '編集に失敗する' do
          fill_in '記事タイトル', with: ""
          click_button '変更を保存する'
          expect(page).to have_content "件のエラーが発生したため 記事 は保存されませんでした。"
        end
      end
    end
  end
end
