FactoryBot.define do
  factory :contact do
    title { 'お問い合わせタイトル' }
    content { 'お問い合わせ中身' }
    user
  end
end
