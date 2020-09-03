FactoryBot.define do
  factory :user do
    last_name { "田中" }
    first_name { "太郎" }
    kana_last_name { "タナカ" }
    kana_first_name { "タロウ" }
    email { "tanaka@example.com" }
    postal_code { "1234567" }
    address { "東京都千代田区123-12-1" }
    phone_number { "12345678910" }
    password { "tanakataro" }
  end
end
