require 'rails_helper'

RSpec.describe "Articles", type: :system do
  describe '記事のテスト' do
    let(:company){FactoryBot.create(:company)}
    let!(:genre){FactoryBot.create(:genre)}
    let!(:article) { FactoryBot.create(:article, company: company, genre: genre) }
    before do
      visit new_company_session_path
      fill_in 'company[email]', with: company.email
      fill_in 'company[password]', with: company.password
      click_button 'ログイン'
    end
    describe 'サイドバーのテスト' do
      context '表示の確認' do
        it '記事検索と表示される' do
          expect(page).to have_content "記事検索"
          expect(current_path).to eq('/corporate/articles')
        end
        it '記事登録と表示される' do
          expect(page).to have_content "記事登録"
          expect(current_path).to eq('/corporate/articles')
        end
      end
    end

    describe '投稿のテスト' do
      context '新規記事投稿ページへ遷移' do
        it '遷移する' do
          click_on '記事登録'
          expect(page).to have_content "新規記事投稿"
          expect(current_path).to eq('/corporate/articles/new')
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
          expect(page).to have_select 'article[genre_id]'
        end
        it '掲載ステータスのセレクトボックスが表示される' do
          expect(page).to have_select 'article[is_active]'
        end
        it '記事タイトルフォームが表示される' do
          expect(page).to have_field 'article[title]'
        end
        it '記事内容フォームが表示される' do
          expect(page).to have_field 'article[body]'
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
          select "テストジャンル", from: "article_genre_id" # select "ラベル", from: "セレクトメニューのid"、検証ツールで確認
          select "掲載中", from: "article_is_active" # select "ラベル", from: "セレクトメニューのid"、検証ツールで確認
          fill_in 'article[title]', with: "RSpecは難しい"
          fill_in 'article[body]', with: "難しいけどテストスイートが通って全部緑になると嬉しい"
          click_button "記事を投稿する"
          expect(page).to have_content "記事を新規投稿しました。"
        end
        it '投稿に失敗する' do
          fill_in 'article[title]', with: ""
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
          expect(current_path).to eq('/corporate/articles/' + article.id.to_s)
        end
        it '記事編集画面への遷移ができる' do
          visit corporate_article_path(article) # 記事詳細画面への遷移
          click_on "編集する"
          expect(page).to have_content "記事情報編集"
          expect(current_path).to eq('/corporate/articles/' + article.id.to_s + '/edit')
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
          expect(page).to have_select('article[genre_id]', selected: 'テストジャンル')
        end
        it '掲載ステータスのセレクトボックスが表示される' do
          expect(page).to have_select('article[is_active]', selected: '掲載中')
        end
        it '記事タイトルフォームが表示される' do
          expect(page).to have_field 'article[title]', with: article.title
        end
        it '記事内容フォームが表示される' do
          expect(page).to have_field 'article[body]', with: article.body
        end
        it '記事編集ボタンが表示される' do
          expect(page).to have_button '変更を保存する'
        end
        it '編集に成功する' do
          select "掲載停止中", from: "article_is_active"
          fill_in 'article[title]', with: "RSpecをスラスラ書けるようになるまで掲載停止します"
          click_button '変更を保存する'
          expect(page).to have_content '記事情報の更新が完了しました。'
          expect(page).to have_content '【現在の掲載状況：掲載停止中】'
          expect(current_path).to eq('/corporate/articles/' + article.id.to_s)
        end
        it '編集に失敗する' do
          fill_in 'article[title]', with: ""
          click_button '変更を保存する'
          expect(page).to have_content "件のエラーが発生したため 記事 は保存されませんでした。"
        end
      end
    end
  end
end
