require 'rails_helper'

RSpec.describe User, type: :model do

  it "姓、名、カナ姓、カナ名、メール、郵便番号、住所、電話番号、パスワードがあれば有効な状態であること" do
    user = User.new(
      last_name: "田中",
      first_name: "太郎",
      kana_last_name: "タナカ",
      kana_first_name: "タロウ",
      email: "tanaka@example.com",
      postal_code: "1234567",
      address: "青森県黒石市123-12-1", 
      phone_number: "12345678910",
      password: "tanakataro"
    )
    expect(user).to be_valid
  end

  it "姓がなければ無効な状態であること" do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("を入力してください")
  end

  it "名がなければ無効な状態であること" do
    user = User.new(last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("を入力してください")
  end
  
  it "カナ姓がなければ無効な状態であること" do
    user = User.new(kana_last_name: nil)
    user.valid?
    expect(user.errors[:kana_last_name]).to include("を入力してください")
  end

  it "カナ名がなければ無効な状態であること" do
    user = User.new(kana_first_name: nil)
    user.valid?
    expect(user.errors[:kana_first_name]).to include("を入力してください")
  end
  
  it "メールアドレスがなければ無効な状態であること" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end
  
  it "郵便番号がなければ無効な状態であること" do
    user = User.new(postal_code: nil)
    user.valid?
    expect(user.errors[:postal_code]).to include("を入力してください")
  end
  
  it "住所がなければ無効な状態であること" do
    user = User.new(address: nil)
    user.valid?
    expect(user.errors[:address]).to include("を入力してください")
  end
  
  it "電話番号がなければ無効な状態であること" do
    user = User.new(phone_number: nil)
    user.valid?
    expect(user.errors[:phone_number]).to include("を入力してください")
  end
  
  it "重複したメールアドレスなら無効な状態であること" do
    User.create(
      last_name: "山田",
      first_name: "二郎",
      kana_last_name: "ヤマダ",
      kana_first_name: "ジロウ",
      email: "yamada@example.com",
      postal_code: "2222222",
      address: "青森県黒石市222-22-2", 
      phone_number: "22222222222",
      password: "yamadajiro"
    )
    
    user = User.new(
      last_name: "山田",
      first_name: "二郎",
      kana_last_name: "ヤマダ",
      kana_first_name: "ジロウ",
      email: "yamada@example.com",
      postal_code: "2222222",
      address: "青森県黒石市222-22-2", 
      phone_number: "22222222222",
      password: "yamadajiro"
    )
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "ユーザーのフルネームを文字列として返すこと" do
    user = User.new(
      last_name: "山田",
      first_name: "二郎",
    )
    expect(user.full_name).to eq "山田 二郎"
  end
end
