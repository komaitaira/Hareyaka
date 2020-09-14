require 'rails_helper'

RSpec.describe Article, type: :model do

  describe "Articleのテスト" do
    before do
      @company = FactoryBot.create(:company)
      @genre = FactoryBot.create(:genre)
      @article = FactoryBot.build(:article)
    end

    # article作成
    context "全てのデータが入っている場合" do
      it "全て入力してあるので保存される" do
        @article.company_id = @company.id
        @article.genre_id = @genre.id
        expect(@article.save).to be true
      end
    end

    context "全てのデータが入っていない場合" do
      it "全て入力されていないので保存されない" do
        @article.company_id = @company.id
        @article.genre_id = @genre.id
        @article.title = ""
        @article.body = ""
        expect(@article.save).to be false
      end
    end
  end

  describe "バリデーションのテスト" do
    before do
      @article = FactoryBot.build(:article)
    end

    context "タイトルが存在しない場合" do
      it "無効な状態であること" do
        @article.title = ""
        @article.valid?
        expect(@article.errors[:title]).to include("を入力してください")
      end
    end

    context "タイトルが35文字を超える場合" do
      it "エラーメッセージが出ること" do
        @article.title = "a" * 36
        @article.valid?
        expect(@article.errors[:title]).to include("は35文字以内で入力してください")
      end
    end

    it "本文がなければ無効な状態であること" do
      @article.body = ""
      @article.valid?
      expect(@article.errors[:body]).to include("を入力してください")
    end
    
  end
end