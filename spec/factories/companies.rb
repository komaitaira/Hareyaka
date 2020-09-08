FactoryBot.define do
  factory :company do
    company_name { "テスト株式会社" }
    kana_company_name { "テストカブシキガイシャ" }
    email { "testcompany@example.com" }
    postal_code { "1234567" }
    address { "東京都千代田区123-12-1" }
    phone_number { "12345678910" }
    password { "a" * 6 }
  end
end
