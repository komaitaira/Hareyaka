require 'rails_helper'

RSpec.describe Company, type: :model do

  describe "バリデーションのテスト" do

    before do
      @company = FactoryBot.build(:company)
    end

    it "企業名、企業カナ名、メール、郵便番号、住所、電話番号、パスワードがあれば有効な状態であること" do
      expect(@company).to be_valid
    end

    it "企業名がなければ無効な状態であること" do
      @company.company_name = ""
      @company.valid?
      expect(@company.errors[:company_name]).to include("を入力してください")
    end

    it "企業カナ名がなければ無効な状態であること" do
      @company.kana_company_name = ""
      @company.valid?
      expect(@company.errors[:kana_company_name]).to include("を入力してください")
    end
    
    it "メールアドレスがなければ無効な状態であること" do
      @company.email = ""
      @company.valid?
      expect(@company.errors[:email]).to include("を入力してください")
    end
    
    it "郵便番号がなければ無効な状態であること" do
      @company.postal_code = ""
      @company.valid?
      expect(@company.errors[:postal_code]).to include("を入力してください")
    end
    
    it "住所がなければ無効な状態であること" do
      @company.address = ""
      @company.valid?
      expect(@company.errors[:address]).to include("を入力してください")
    end
    
    it "電話番号がなければ無効な状態であること" do
      @company.phone_number = ""
      @company.valid?
      expect(@company.errors[:phone_number]).to include("を入力してください")
    end

    it "パスワードが6文字以上でなければ無効であること" do
      @company.password = "a" * 5
      @company.valid?
      expect(@company.errors[:password]).to include("は6文字以上で入力してください")
    end
    
    it "重複したメールアドレスなら無効な状態であること" do
      FactoryBot.create(:company)
      @company.valid?
      expect(@company.errors[:email]).to include("はすでに存在します")
    end
    
  end
end
