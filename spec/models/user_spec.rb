require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "バリデーションのテスト" do
    it "姓、名、カナ姓、カナ名、メール、郵便番号、住所、電話番号、パスワードがあれば有効な状態であること" do
      expect(@user).to be_valid
    end

    it "姓がなければ無効な状態であること" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors[:last_name]).to include("を入力してください")
    end

    it "姓が10文字以下でなければ無効であること" do
      @user.last_name = "a" * 11
      @user.valid?
      expect(@user.errors[:last_name]).to include("は10文字以内で入力してください")
    end

    it "名がなければ無効な状態であること" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors[:first_name]).to include("を入力してください")
    end

    it "名が10文字以下でなければ無効であること" do
      @user.first_name = "a" * 11
      @user.valid?
      expect(@user.errors[:first_name]).to include("は10文字以内で入力してください")
    end
    
    it "カナ姓がなければ無効な状態であること" do
      @user.kana_last_name = ""
      @user.valid?
      expect(@user.errors[:kana_last_name]).to include("を入力してください")
    end

    it "カナ姓が10文字以下でなければ無効であること" do
      @user.kana_last_name = "a" * 11
      @user.valid?
      expect(@user.errors[:kana_last_name]).to include("は10文字以内で入力してください")
    end

    it "カナ名がなければ無効な状態であること" do
      @user.kana_first_name = ""
      @user.valid?
      expect(@user.errors[:kana_first_name]).to include("を入力してください")
    end

    it "カナ名が10文字以下でなければ無効であること" do
      @user.kana_first_name = "a" * 11
      @user.valid?
      expect(@user.errors[:kana_first_name]).to include("は10文字以内で入力してください")
    end
    
    it "メールアドレスがなければ無効な状態であること" do
      @user.email = ""
      @user.valid?
      expect(@user.errors[:email]).to include("を入力してください")
    end

    it "メールアドレスが30文字以下でなければ無効な状態であること" do
      @user.email = "a" * 31
      @user.valid?
      expect(@user.errors[:email]).to include("は30文字以下で入力してください。")
    end
    
    it "郵便番号がなければ無効な状態であること" do
      @user.postal_code = ""
      @user.valid?
      expect(@user.errors[:postal_code]).to include("を入力してください")
    end

    it "郵便番号が7文字未満であれば無効な状態であること" do
      @user.postal_code = "a" * 6
      @user.valid?
      expect(@user.errors[:postal_code]).to include("は7文字以上で入力してください")
    end

    it "郵便番号が7文字を超えると無効な状態であること" do
      @user.postal_code = "a" * 8
      @user.valid?
      expect(@user.errors[:postal_code]).to include("は7文字以内で入力してください")
    end
    
    it "住所がなければ無効な状態であること" do
      @user.address = ""
      @user.valid?
      expect(@user.errors[:address]).to include("を入力してください")
    end

    it "住所が30文字以下でなければ無効な状態であること" do
      @user.address = "a" * 31
      @user.valid?
      expect(@user.errors[:address]).to include("は30文字以内で入力してください")
    end
    
    it "電話番号がなければ無効な状態であること" do
      @user.phone_number = ""
      @user.valid?
      expect(@user.errors[:phone_number]).to include("を入力してください")
    end

    it "電話番号が12文字以下でなければ無効な状態であること" do
      @user.phone_number = "a" * 13
      @user.valid?
      expect(@user.errors[:phone_number]).to include("は12文字以内で入力してください")
    end

    it "自己紹介文が200文字以下でなければ無効な状態であること" do
      @user.introduction = "a" * 201
      @user.valid?
      expect(@user.errors[:introduction]).to include("は200文字以内で入力してください")
    end

    it "パスワードが6文字以上でなければ無効であること" do
      @user.password = "a" * 5
      @user.valid?
      expect(@user.errors[:password]).to include("は6文字以上で入力してください。")
    end
    
    it "重複したメールアドレスなら無効な状態であること" do
      FactoryBot.create(:user)
      @user.valid?
      expect(@user.errors[:email]).to include("は既に存在します。")
    end
  end

  describe "インスタンスメソッドのテスト" do
    it "ユーザーのフルネームを文字列として返すこと" do
      @user.last_name = "テスト"
      @user.first_name = "太郎"
      expect(@user.full_name).to eq "テスト 太郎"
    end

    it "ユーザーのカナフルネームを文字列として返すこと" do
      @user.kana_last_name = "テスト"
      @user.kana_first_name = "タロウ"
      expect(@user.kana_full_name).to eq "テスト タロウ"
    end
  end

end
