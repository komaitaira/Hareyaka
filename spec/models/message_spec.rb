require 'rails_helper'

RSpec.describe Message, type: :model do
  describe "バリデーションのテスト" do
    it "メッセージがなければ無効な状態であること" do
      message = Message.new(message: nil)
      message.valid?
      expect(message.errors[:message]).to include("を入力してください")
    end
  end
end
