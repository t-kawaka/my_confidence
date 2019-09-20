FactoryBot.define do
  factory :user do
    name {"user1"}
    email { "test1@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
    icon { nil }
    admin { false }
  end
end
