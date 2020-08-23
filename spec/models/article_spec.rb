require 'rails_helper'

RSpec.describe Article, type: :model do
  # company作成
  let(:company) { Company.create!(c_params) }
  let(:c_params) { 
    {
      company_name: "ヨントリーホールディングス",
      kana_company_name: "ヨントリーホールディングス",
      postal_code: "1111111",
      address: "東京都千代田区丸の内1丁目111-11-1",
      phone_number: "11111111111",
      email: "yontory@example.com",
      password: "yontory",
      is_active: true
    }
  }
  # ジャンル作成
  let(:genre) { Genre.create!(g_params) }
  let(:g_params) { 
    {
      genre_name: '健康',
      is_active: true
    }
  }
  # article作成
  context "全てのデータが入っている場合" do
    let(:article) { Article.new(a_params) }
    let(:a_params) { 
      {
        company: company,
        genre: genre,
        title: "健康食品について",
        body: "テスト本文",
        is_active: true
      }
    }
    it "全て入力してあるので保存される" do
      expect(article.save).to be true
    end
  end
end