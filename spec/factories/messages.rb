FactoryBot.define do
  factory :message do
    user_id { 1 }
    conversation_id { 1 }
    body { "MyText" }
  end
end
