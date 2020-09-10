FactoryBot.define do
  factory :admin do
    email { "testadmin@example.com" }
    password { "a" * 6 }
  end
end
