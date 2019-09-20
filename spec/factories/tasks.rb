FactoryBot.define do
  factory :task do
    title { "MyConfidence" }
    description { "文章作成" }
    notice {nil}
    start_time { DateTime.now }
    require_time { 10 }
    progress { "開始" }
    admin { false }
  end
end
