require 'rails_helper'

RSpec.describe Company, type: :model do

  describe "バリデーションのテスト" do

    it "企業名、企業カナ名、メール、郵便番号、住所、電話番号、パスワードがあれば有効な状態であること" do
      company = Company.new(
        company_name: "ヨントリーホールディングス",
        kana_company_name: "ヨントリーホールディングス",
        email: "yontory@example.com",
        postal_code: "1111111",
        address: "東京都千代田区丸の内1丁目111-11-1",
        phone_number: "11111111111",
        password: "yontory"
      )
      expect(company).to be_valid
    end

    it "企業名がなければ無効な状態であること" do
      company = Company.new(company_name: nil)
      company.valid?
      expect(company.errors[:company_name]).to include("を入力してください")
    end

    it "企業カナ名がなければ無効な状態であること" do
      company = Company.new(kana_company_name: nil)
      company.valid?
      expect(company.errors[:kana_company_name]).to include("を入力してください")
    end
    
    it "メールアドレスがなければ無効な状態であること" do
      company = Company.new(email: nil)
      company.valid?
      expect(company.errors[:email]).to include("を入力してください")
    end
    
    it "郵便番号がなければ無効な状態であること" do
      company = Company.new(postal_code: nil)
      company.valid?
      expect(company.errors[:postal_code]).to include("を入力してください")
    end
    
    it "住所がなければ無効な状態であること" do
      company = Company.new(address: nil)
      company.valid?
      expect(company.errors[:address]).to include("を入力してください")
    end
    
    it "電話番号がなければ無効な状態であること" do
      company = Company.new(phone_number: nil)
      company.valid?
      expect(company.errors[:phone_number]).to include("を入力してください")
    end

    it "パスワードが6文字以上でなければ無効であること" do
      company = Company.new(password: "yontr")
      company.valid?
      expect(company.errors[:password]).to include("は6文字以上で入力してください")
    end
    
    it "重複したメールアドレスなら無効な状態であること" do
      Company.create(
        company_name: "ヨントリーホールディングス",
        kana_company_name: "ヨントリーホールディングス",
        email: "yontory@example.com",
        postal_code: "1111111",
        address: "東京都千代田区丸の内1丁目111-11-1",
        phone_number: "11111111111",
        password: "yontory"
      )
      
      company = Company.new(
        company_name: "ヨントリーホールディングス",
        kana_company_name: "ヨントリーホールディングス",
        email: "yontory@example.com",
        postal_code: "1111111",
        address: "東京都千代田区丸の内1丁目111-11-1",
        phone_number: "11111111111",
        password: "yontory"
      )
      company.valid?
      expect(company.errors[:email]).to include("はすでに存在します")
    end
    
  end
end
