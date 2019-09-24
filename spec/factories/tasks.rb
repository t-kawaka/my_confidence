# == Schema Information
#
# Table name: tasks
#
#  id           :bigint           not null, primary key
#  title        :string(30)       not null
#  description  :text             not null
#  start_time   :datetime         not null
#  notice       :text
#  require_time :integer          not null
#  progress     :string           default("開始"), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint
#

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
