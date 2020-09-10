FactoryBot.define do
  factory :article do
    title { "テストタイトル" }
    body { "テスト本文" }
    is_active { true }
  end
end
