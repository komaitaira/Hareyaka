require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe "バリデーションのテスト" do
    it "ジャンル名がなければ無効な状態であること" do
      @genre = FactoryBot.build(:genre)
      @genre.genre_name = ""
      @genre.valid?
      expect(@genre.errors[:genre_name]).to include("を入力してください")
    end
  end
end
