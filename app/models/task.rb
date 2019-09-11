class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true
  validates :start_time, presence: true
  validate :start_cannnot_be_in_the_future

  def start_cannnot_be_in_the_future
    if start_time.present? && start_time > Date.today
      errors.add(:start_time, "明日以降の日付は設定できません！")
    end
  end
end
