FactoryBot.define do
  factory :comment do
    user
    task
    content { "コメントを残します" }
  end
end
